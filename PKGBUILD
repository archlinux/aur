# Maintainer: tippfehlr <tippfehlr@tippfehlr.eu>

pkgname=openbuilds-control-bin
pkgver=1.0.382
pkgrel=1
pkgdesc="Grbl Host / Interface for all CNC style machines running Grbl"
url="https://github.com/OpenBuilds/OpenBuilds-CONTROL"
license=("GPL-3.0-only")
arch=("x86_64")
provides=("openbuilds-control")
conflicts=("openbuilds-control")
depends=('glibc' 'gcc-libs' 'electron23' 'dbus' 'libxdamage' 'nss' 'at-spi2-core' 'cairo' 'alsa-lib' 'libdrm' 'gtk3' 'libxcomposite' 'expat' 'libx11' 'glib2' 'libxfixes' 'libcups' 'libxrandr' 'pango' 'nspr' 'python' 'libxcb' 'mesa' 'libxext' 'libxkbcommon' 'hicolor-icon-theme')
source=(
    "$url/releases/download/v${pkgver}/OpenBuildsCONTROL_${pkgver}_amd64.deb"
    "openbuildscontrol"
)
sha512sums=('88818134b9cf3b9a0ca7e0d299a6a4d5d9e3ce7c116c8a90792e3c9fdba7cacdabbb7b7d582905ebd426683ec129578c6cfaa6f9391dbd3ae9c74d6a3b137240'
            '7d9833000c547ef14a0e7a272903991db3b3a2297527e2fd40d1e2a20c34f6771edce68b736a1859d6c3dd769f263ff90a073622f7bdcdd33a6274b40299f925')
prepare() {
    cd $srcdir
    tar -pxf data.tar.xz
    sed -i 's|Exec=.*|Exec=/usr/bin/openbuildscontrol %U|' usr/share/applications/openbuildscontrol.desktop
    sed -i 's/OpenBuildsCONTROL/OpenBuilds CONTROL/' usr/share/applications/openbuildscontrol.desktop
}

package() {
    cd $srcdir
    cp -ar "usr" "$pkgdir/"
    install -Dm644 "opt/OpenBuildsCONTROL/resources/app.asar" -t "$pkgdir/usr/lib/openbuilds-control/"
    install -Dm755 "openbuildscontrol" -t "$pkgdir/usr/bin/"
}
