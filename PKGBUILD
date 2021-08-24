# Maintainer: taotieren <admin@taotieren.com>

pkgname=netassistant-git
_pkgname=NetAssistant
pkgver=v1.0.0.r4.ge6bca9a
pkgrel=1
epoch=
pkgdesc="A network debugging assistant based on Qt GUI."
arch=('any')
url="https://github.com/busyluo/NetAssistant"
license=('GPL3')
groups=()
depends=('qt5-base')
makedepends=("gcc" "git")
checkdepends=()
optdepends=()
provides=(NetAssistant)
conflicts=(netassistant)
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${_pkgname}::git+https://hub.fastgit.org/busyluo/NetAssistant.git")
noextract=()
sha256sums=('SKIP')
#validpgpkeys=()

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    qmake
    make
}

package() {
    install -Dm0755 "${srcdir}/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm0755 "${srcdir}/${_pkgname}/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm0644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/metainfo/io.github.busyluo.netassistant.metainfo.xml" << EOF
<?xml version="1.0" encoding="UTF-8"?>
<component type="desktop-application">
  <id>io.github.busyluo.netassistant</id>

  <name>${pkgname%-git}</name>
  <summary>${pkgname%-git}</summary>

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

    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/io.github.busyluo.netassistant.desktop" << EOF
[Desktop Entry]
Version=1.0
Type=Application

Name=${pkgname%-git}
Comment=NetAssistant
Categories=Network;Qt;

Icon=${pkgname%-git}.png
Exec=${pkgname%-git}
Terminal=false
EOF
}
