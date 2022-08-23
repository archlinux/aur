# Maintainer: taotieren <admin@taotieren.com>

_pkgname=SerialTest
pkgname=serialtest
pkgver=0.2
pkgrel=0
pkgdesc="A cross-platform serial port test tool."
arch=('any')
url="https://github.com/wh201906/SerialTest"
license=('GPL2.1')
provides=(${_pkgname})
conflicts=(${pkgname}-git)
#replaces=(${pkgname})
depends=('qcustomplot' 'qt5-serialport' 'qt5-connectivity')
makedepends=('qt5-tools')
backup=()
options=('!strip')
install=${pkgname}.install
source=("${_pkgname}-${pkgver}.tar.gz::https://ghproxy.com/${url}/archive/refs/tags/V${pkgver}.tar.gz"
        "${pkgname}.install")
sha256sums=('31ecfbf366ab30fde266021459dbc3315dd17c872aed5d740fe3503d5dd60c7b'
            '303f34246c0d341e1093d6e486e2cbfdbbb0d122d751de649f562ebac37777b4')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}/src/"
    qmake
    make
}

package() {
    install -Dm0755 "${srcdir}/${_pkgname}-${pkgver}/src/${_pkgname}"  "${pkgdir}/usr/bin/${pkgname}"

    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/metainfo/io.github.wh201906.serialtest.metainfo.xml" << EOF
<?xml version="1.0" encoding="UTF-8"?>
<component type="desktop-application">
  <id>io.github.wh201906.serialtest</id>

  <name>SerialTest</name>
  <summary>SerialTest</summary>

  <metadata_license>MIT</metadata_license>
  <project_license>GPL-2.0-or-later</project_license>

  <description>
    <p>
      A cross-platform serial port test tool.
    </p>
  </description>

  <launchable type="desktop-id">io.github.wh201906.serialtest.desktop</launchable>
</component>
EOF

    install -Dm0644 /dev/stdin "${pkgdir}/usr/share/applications/io.github.wh201906.serialtest.desktop" << EOF
[Desktop Entry]
Version=1.0
Type=Application

Name=SerialTest
Comment=SerialTest
Categories=Development;Electronics;

Icon=serialtest
Exec=serialtest
Terminal=false
EOF

    install -Dm0644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "$srcdir/${_pkgname}-${pkgver}/src/icon/icon.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"
#    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/${_pkgname}/pkg/20-usb-serial.rules" "${pkgdir}/etc/udev/rules.d/20-usb-serial.rules"
}
