pkgname=smartie-pwa
pkgver=0.1
pkgrel=3
arch=('x86_64')
url="https://cgit.ctu.cx/${pkgname}/"
license=( 'GPL-3' )
depends=( 'glibc' )
makedepends=( 'yarn' 'git' )
_commit="cbd311c96b80fbb8a464a5aa6b651649d65a5857"
source=("${pkgname}-${_commit}.tar.gz::https://cgit.ctu.cx/${pkgname}/snapshot/${pkgname}-${_commit}.tar.gz")
sha256sums=('8223e9ba82b549729946c3fe5e3dc6804ae40344d717a3735c6855a1512ee509')

build() {
  cd "$srcdir/${pkgname}-${_commit}/"
  yarn install
  ./node_modules/rollup/dist/bin/rollup -c
}

package() {
  cd "$srcdir/${pkgname}-${_commit}"
  install -dm755  "$pkgdir"/usr/share/webapps/smartie-pwa/
  install -Dm755 ./index.html           "$pkgdir"/usr/share/webapps/smartie-pwa/
  install -Dm755 ./main.min.js          "$pkgdir"/usr/share/webapps/smartie-pwa/
  install -Dm755 ./sw.js                "$pkgdir"/usr/share/webapps/smartie-pwa/
  install -Dm755 ./manifest.json        "$pkgdir"/usr/share/webapps/smartie-pwa/
  install -Dm755 ./favicon-512x512.png  "$pkgdir"/usr/share/webapps/smartie-pwa/
}
