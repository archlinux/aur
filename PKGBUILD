# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>
pkgname=routeconverter
pkgver=2.16.3
pkgrel=1
pkgdesc="A free tool to edit and convert routes, tracks and waypoints."
# not sure if 64bit version works - on http://static.routeconverter.com/download/previous-releases/2.16/ there is no 64bit version any more
arch=(i686)
#arch=(i686 x86_64)
url="http://www.routeconverter.de/en"
license=('GPL')
depends=('java-environment>=6' 'libwebkit3')
optdepends=('gpsbabel: for some additional format support')
changelog=ChangeLog
source=(routeconverter
        routeconverter-cli
        http://www.routeconverter.de/download/RouteConverterCmdLine.jar)
[ "$CARCH" == "i686" ]   && source=(${source[@]} http://www.routeconverter.de/download/RouteConverterLinux.jar)
#[ "$CARCH" == "x86_64" ] && source=(${source[@]} http://www.routeconverter.de/download/RouteConverterLinux64.jar)

md5sums=('4bc45e6a1a93656a0deb8956f71b6af8'
         'fdf570309917df1c1536b7e3c7740b33'
         'e95c8f2f2fe68054eb9e06370eb2439e')
[ "$CARCH" == "i686" ]   && md5sums=(${md5sums[@]} '96b38e7eaebc22ba21575e50e1c89bfd')
#[ "$CARCH" == "x86_64" ] && md5sums=(${md5sums[@]} '8d99d74806864946803131d7ecef9795')

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

  [ "$CARCH" == "i686" ] && \
  install -m 644 -o root -g root \
			${srcdir}/RouteConverterLinux.jar \
			${pkgdir}/usr/lib/${pkgname}/ || true

  #[ "$CARCH" == "x86_64" ] && \
  #install -m 644 -o root -g root \
			#${srcdir}/RouteConverterLinux64.jar \
			#${pkgdir}/usr/lib/${pkgname}/ || true

  ln -s /usr/lib/libwebkitgtk-1.0.so.0 ${pkgdir}/usr/lib/${pkgname}/libwebkit-1.0.so.2
  ln -s libwebkit-1.0.so.2 ${pkgdir}/usr/lib/${pkgname}/libwebkit-1.0.so
}

