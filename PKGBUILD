# Maintainer: taotieren <admin@taotieren.com>

pkgname=netassistant
_pkgname=NetAssistant
pkgver=1.0.0
pkgrel=2
epoch=
pkgdesc="A network debugging assistant based on Qt GUI."
arch=($CARCH)
url="https://github.com/busyluo/NetAssistant"
license=('GPL-3.0-only')
groups=()
depends=(qt5-base)
makedepends=(
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
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('75b2397809fbde45dc6594073e7dcd2e9b00ea73a558f40b8912ca02e54b3dc4')
#validpgpkeys=()

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  qmake
  make
}

package() {
  install -Dm0755 "${srcdir}/${_pkgname}-${pkgver}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm0755 "${srcdir}/${_pkgname}-${pkgver}/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm0644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
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
