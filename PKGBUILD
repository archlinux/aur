pkgname=smartie-pwa
pkgver=0.1
pkgrel=5
arch=('x86_64')
url="https://cgit.ctu.cx/${pkgname}/"
license=( 'GPL-3' )
depends=( 'glibc' )
makedepends=( 'yarn' 'git' )
_commit="b95c11fb11b57813f388a83eb1846c2aa9baf577"
source=("${pkgname}-${_commit}.tar.gz::https://cgit.ctu.cx/${pkgname}/snapshot/${pkgname}-${_commit}.tar.gz")
sha256sums=('7772c7b170be609eca34704b0330764f8cd902b8661d57de06f7a1beb8a5fa24')

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
