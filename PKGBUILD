# Maintainer: Espen Fossen <espfos@junta.no>

pkgname=mstream
pkgver=4.1.3
pkgrel=1
pkgdesc='Music player server with a web-based interface'
arch=('any')
url="http://mstream.io"
license=('GPL3')
depends=('nodejs')
makedepends=('npm')
install=mstream.install
backup=('var/lib/mstream/config.json')
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz
        mstream.service
	config.json)
noextract=($pkgname-$pkgver.tgz)

package() {
  npm install -g --user root --prefix "$pkgdir"/usr $pkgname-$pkgver.tgz
  install -d -g 49 -o 49 "${pkgdir}/var/lib/${pkgname}"
  install -d -g 49 -o 49 "${pkgdir}/var/lib/${pkgname}/media"
  install -d -g 49 -o 49 "${pkgdir}/var/lib/${pkgname}/album-art"
  install -Dm644 mstream.service "$pkgdir"/usr/lib/systemd/system/mstream.service
  install -Dm644 -g 49 -o 49 config.json "${pkgdir}/var/lib/${pkgname}/config.json"
}
md5sums=('d1239364ad82d44edc13261cd04b0d20'
         '6640e102dd29a6da5c4c075e4c4042d7'
         '4ed71dda48801c584be9be3cb4103d45')
