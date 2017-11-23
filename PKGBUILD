# Maintainer: Espen Fossen <espfos@junta.no>

pkgname=mstream
pkgver=3.2.1
pkgrel=1
pkgdesc='Music player server with a web-based interface'
arch=('any')
url="http://mstream.io"
license=('GPL3')
depends=('nodejs')
makedepends=('npm')
install=mstream.install
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz
        mstream.service
	config.json)
noextract=($pkgname-$pkgver.tgz)

package() {
  mkdir -p "${pkgdir}/var/lib/${pkgname}/media"
  chown 49:49 "${pkgdir}/var/lib/${pkgname}/media"
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz
  install -d -g 49 -o 49 "${pkgdir}/var/lib/${pkgname}"
  install -Dm644 mstream.service "$pkgdir"/usr/lib/systemd/system/mstream.service
  install -Dm644 -g 49 -o 49 "${srcdir}/config.json" "${pkgdir}/var/lib/${pkgname}/config.json"
}
md5sums=('5ff5a5816f5196b28ba429e3e84ee991'
         '0b309cbd40d88a64f2c9159833df53bf'
         '483d0a108cc082df206437ba62b5ddc9')
