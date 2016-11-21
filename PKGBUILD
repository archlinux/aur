# Maintainer: Ilya Kovalenko <agentsib@gmail.com>
# Contributors: elbahek <elbahek@gmail.com>


pkgname=joxi
pkgver=3.0.9
pkgrel=3
pkgdesc="Easy to use screenshot sharing application (Russian)"
arch=('i686' 'x86_64')
url="http://joxi.net"
license=('unknown')
options=('emptydirs')
depends=('qt5-declarative' 'qt5-x11extras' 'qt5-base' 'qt5-script' 'qt5-xmlpatterns' 'qt5-multimedia' 'qt5-quick1' 'libgl' 'libx11' 'libstdc++5' 'libxdamage' 'glib2' 'gtk2' 'libmcrypt' 'libcurl-compat' 'libappindicator-gtk2')

if [ "${CARCH}" = 'x86_64' ]; then
    md5sums=("5c2ef9b7e6b39dfb731f62ef0d146cb7" "fa1d9cf5344c0e586d1cf0784713195b")
elif [ "${CARCH}" = 'i686' ]; then
    md5sums=("6d62ab37f316f09f3fa666379eae4696" "fa1d9cf5344c0e586d1cf0784713195b")
fi
ARCH=${CARCH}

source=(
	"http://dl.joxi.ru/linux/${pkgname}-net_${ARCH}-fr.rpm"
    "joxi.ld_preload.wrapper"
)

package() {

    # there is no /usr/lib/joxi dir, so this config is pointless
    install -D -m755 "${srcdir}/etc/ld.so.conf.d/${pkgname}.conf" "${pkgdir}/etc/ld.so.conf.d/${pkgname}.conf"

    install -D -m644 "${srcdir}/opt/${pkgname}/icon_64.png" "${pkgdir}/opt/joxi/icon_64.png"
    install -D -m644 "${srcdir}/opt/${pkgname}/icon_light.png" "${pkgdir}/opt/joxi/icon_light.png"

    install -D -m755 "${srcdir}/usr/bin/joxi" "${pkgdir}/opt/joxi/joxi"
    
	install -D -m755 "${srcdir}/joxi.ld_preload.wrapper" "${pkgdir}/usr/bin/joxi"

 	install -D -m755 "${srcdir}/usr/share/applications/Joxi.desktop" "${pkgdir}/usr/share/applications/Joxi.desktop"
    # install -D -m755 "${srcdir}/joxi.desktop" "${pkgdir}/usr/share/applications/Joxi.desktop"
}
