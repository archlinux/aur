# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>

pkgname=routeconverter
pkgver=2.20
pkgrel=1
pkgdesc="A free tool to edit and convert routes, tracks and waypoints."
arch=(i686 x86_64)
url="http://www.routeconverter.de/en"
license=('GPL')
depends=('java-environment>=6' 'libwebkit3')
optdepends=('gpsbabel: for some additional format support')
changelog=ChangeLog
sourcecommon=(routeconverter
              routeconverter-cli
              http://static.routeconverter.com/download/previous-releases/${pkgver}/RouteConverterCmdLine.jar)
source=(${sourcecommon[@]} http://static.routeconverter.com/download/previous-releases/${pkgver}/RouteConverterLinux.jar)

md5sums=('e4cdc9db82a9f8c550afb44f851d897f'
         'fdf570309917df1c1536b7e3c7740b33'
         '360708b4bd406d9efa34c16e5a49635e'
         '416ddd7953cc4065afb0295d2aa90ef7')

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
