# Maintainer: taotieren <admin@taotieren.com>

pkgname=netassistant
_pkgname=NetAssistant
pkgver=1.1.0
pkgrel=1
epoch=
pkgdesc="A network debugging assistant based on Qt GUI."
arch=($CARCH)
url="https://github.com/busyluo/NetAssistant"
license=('GPL-3.0-only')
groups=()
depends=(qt5-base)
makedepends=(
  git
  qt5-tools
)
checkdepends=()
optdepends=()
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${_pkgname}::git+${url}.git#tag=v${pkgver}")
noextract=()
sha256sums=('76d47cca62e4e27ae11459481bb2955570c67b30f6d82b32a8147a43b78c4c0b')
#validpgpkeys=()

prepare() {
  git -C "${srcdir}/${_pkgname}" clean -dfx
}

build() {
  cd "${srcdir}/${_pkgname}"
  qmake
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm0755 ${_pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm0755 ${_pkgname}.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm0644 /dev/stdin "${pkgdir}/usr/share/metainfo/io.github.busyluo.netassistant.metainfo.xml" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<component type="desktop-application">
  <id>io.github.busyluo.netassistant</id>

  <name>${pkgname}</name>
  <summary>${pkgname}</summary>

  <metadata_license>MIT</metadata_license>
  <project_license>AGPL-3.0-only</project_license>

  <description>
    <p>
      A network debugging assistant based on Qt GUI.
    </p>
  </description>

  <launchable type="desktop-id">io.github.busyluo.netassistant.desktop</launchable>
</component>
EOF

  install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/io.github.busyluo.netassistant.desktop" <<EOF
[Desktop Entry]
Version=1.0
Type=Application

Name=${pkgname}
Comment=NetAssistant
Categories=Network;Qt;

Icon=${pkgname}.png
Exec=${pkgname}
Terminal=false
EOF
}
