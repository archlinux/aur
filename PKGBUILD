pkgname=smartie-pwa
pkgver=0.1
pkgrel=1
arch=('x86_64')
url="https://cgit.ctu.cx/${pkgname}/"
license=( 'GPL-3' )
depends=( 'glibc' )
makedepends=( 'yarn' 'git' )
_commit="8eb18cf941fb850b36c7dc586907837bee2fccc9"
source=("${pkgname}-${_commit}.tar.gz::https://cgit.ctu.cx/${pkgname}/snapshot/${pkgname}-${_commit}.tar.gz")
sha256sums=('cf4b091199f0b420baa86563af1112890cf15fc807d6e57cd23c1893612456d6')

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
