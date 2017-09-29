# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>

pkgname=routeconverter
pkgver=2.21.2
pkgrel=1
pkgdesc="A free tool to edit and convert routes, tracks and waypoints."
arch=(i686 x86_64)
url="http://www.routeconverter.de/en"
license=('GPL')
depends=('java-environment>=6' 'libwebkit3')
optdepends=('gpsbabel: for some additional format support')
changelog=ChangeLog
source=(routeconverter
        routeconverter-cli
        http://static.routeconverter.com/download/previous-releases/2.21/RouteConverterCmdLine.jar
        http://static.routeconverter.com/download/RouteConverterLinux.jar)

noextract=(RouteConverterCmdLine.jar
           RouteConverterLinux.jar
           RouteConverterLinux64.jar)

build()
{
  cd "$srcdir"
}

package()
{
  cd "$srcdir"

  install -m 755 -o root -g root -d ${pkgdir}/usr/bin
  install -m 755 -o root -g root -d ${pkgdir}/usr/lib/${pkgname}
  install -m 755 -o root -g root \
			${srcdir}/routeconverter \
			${srcdir}/routeconverter-cli \
			${pkgdir}/usr/bin/
  install -m 644 -o root -g root \
			${srcdir}/RouteConverterCmdLine.jar \
			${pkgdir}/usr/lib/${pkgname}/

  install -m 644 -o root -g root \
			${srcdir}/RouteConverterLinux.jar \
			${pkgdir}/usr/lib/${pkgname}/ || true

  ln -s /usr/lib/libwebkitgtk-1.0.so.0 ${pkgdir}/usr/lib/${pkgname}/libwebkit-1.0.so.2
  ln -s libwebkit-1.0.so.2 ${pkgdir}/usr/lib/${pkgname}/libwebkit-1.0.so
}
md5sums=('e4cdc9db82a9f8c550afb44f851d897f'
         'fdf570309917df1c1536b7e3c7740b33'
         '6a5a794dc2cc50e8311babdddd90187f'
         'b9a5dd980e8ff223f519b7b16be24408')
