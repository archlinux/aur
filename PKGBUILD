# Maintainer: Boohbah <boohbah at gmail.com>
# Contributor: Dogukan Korkmazturk <d.korkmazturk at gmail.com>
# Contributor: Dincer Celik <dincer at bornovali.com>

pkgname=netscape-navigator
pkgver=9.0.0.6
pkgrel=5
pkgdesc='Standalone web browser from netscape.com'
url='http://browser.netscape.com'
source=("http://root--servers.org/ArchLinux/${pkgname}-${pkgver}.tar.gz"
        'netscape-navigator.desktop' 'netscape.png')
md5sums=('60efd0ade838a159ab06a5a446045fe9'
         'bf88f35d22f5af4c6a716db3f67c42ee'
         'c24bd2826d3b5d45038064fc83a3995b')
license=('custom')
arch=('i686' 'x86_64')

if [ "$CARCH" = "i686" ]; then
  depends=('gtk2' 'js' 'libxt' 'libstdc++5' 'pangox-compat' 'xulrunner' 'dbus-glib')
elif [ "$CARCH" = "x86_64" ]; then
  depends=('lib32-gtk2' 'lib32-js17' 'lib32-libxt' 'lib32-libstdc++5' \
           'lib32-pangox-compat' 'lib32-xulrunner' 'lib32-dbus-glib')
fi

package() {
  mkdir -pv ${pkgdir}/opt/netscape ${pkgdir}/usr/lib32 ${pkgdir}/usr/bin
  cp -Rv ${srcdir}/navigator/ ${pkgdir}/opt/netscape
  ln -sv /opt/netscape/navigator/navigator ${pkgdir}/usr/bin/navigator
  cp -v ${srcdir}/navigator/libmozjs.so ${pkgdir}/usr/lib32
  cp -v ${srcdir}/navigator/libxpcom_core.so ${pkgdir}/usr/lib32
  cp -v ${srcdir}/navigator/libxpcom_compat.so ${pkgdir}/usr/lib32
  install -D -m644 -v ${srcdir}/${pkgname}.desktop \
                      ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -D -m644 -v ${srcdir}/netscape.png ${pkgdir}/usr/share/pixmaps/netscape.png
}

# vim:set ts=2 sw=2 et:
