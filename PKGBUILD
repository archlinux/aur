# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>
# Contributor: willemw

pkgname=routeconverter
pkgver=2.26
pkgrel=1
pkgdesc="A free tool to edit and convert routes, tracks and waypoints"
arch=('i686' 'x86_64')
url="http://www.routeconverter.de/en"
license=('GPL')
depends=('java-environment>=6' 'java-openjfx')
makedepends=('gendesk' 'unzip')
optdepends=('gpsbabel: for some additional format support')
changelog=ChangeLog
source=(routeconverter
        routeconverter-offline
        routeconverter-cli
        http://static.routeconverter.com/download/previous-releases/${pkgver}/RouteConverterCmdLine.jar
        http://static.routeconverter.com/download/RouteConverterLinux.jar)

noextract=(RouteConverterCmdLine.jar
           RouteConverterLinux.jar)

build() {
  cd "${srcdir}"
  gendesk -f -n --pkgname "${pkgname}" --exec "routeconverter" --pkgdesc "$pkgdesc" --categories 'Utility'
  gendesk -f -n --pkgname "${pkgname}_offline" --exec "routeconverter-offline" --pkgdesc "$pkgdesc (offline)" --categories 'Utility'
}

package()
{
  install -m755 -d "${pkgdir}/usr/bin"
  install -m755 -d "${pkgdir}/usr/share/pixmaps"
  install -m755 -d "${pkgdir}/usr/lib/${pkgname}"
  install -m755 "${srcdir}/routeconverter" \
		"${srcdir}/routeconverter-cli" \
		"${pkgdir}/usr/bin/"
  for _ in RouteConverterCmdLine RouteConverterLinux
  do
  	install -m644 "${srcdir}/${_}.jar" "${pkgdir}/usr/lib/${pkgname}/"
  done
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  unzip -p "${srcdir}/RouteConverterLinux.jar" slash/navigation/converter/gui/RouteConverter.png >"${pkgdir}/usr/share/pixmaps/routeconverter.png"
}

md5sums=('e4cdc9db82a9f8c550afb44f851d897f'
         'a9e4b76c2aa26c6a0b7a9474964c9648'
         'fdf570309917df1c1536b7e3c7740b33'
         '3b7cf17f3c5eb3398c6a8f17b68b8473'
         'a077c76d6b2056e7fbe7dd5ad079b5d9')
