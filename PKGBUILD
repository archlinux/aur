# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>
pkgname=routeconverter
pkgver=2.18.5
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
        http://www.routeconverter.de/download/RouteConverterCmdLine.jar)
source=(${sourcecommon[@]} http://www.routeconverter.de/download/RouteConverterLinux.jar)

md5sumscommon=('4bc45e6a1a93656a0deb8956f71b6af8'
         'fdf570309917df1c1536b7e3c7740b33'
         'f2b6d764bfb8687705a04641207b37ae'
)

md5sums=('e4cdc9db82a9f8c550afb44f851d897f'
         'fdf570309917df1c1536b7e3c7740b33'
         'fcd5ba246148aaf589c5dec2431aeb20'
         '6179b82a7d0f53912b6fb107384fa83f')

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
