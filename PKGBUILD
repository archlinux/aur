pkgname=smartie-pwa
pkgver=0.1
pkgrel=2
arch=('x86_64')
url="https://cgit.ctu.cx/${pkgname}/"
license=( 'GPL-3' )
depends=( 'glibc' )
makedepends=( 'yarn' 'git' )
_commit="fa273df5c71dfecf744e352c3b2b68cfdc2370a2"
source=("${pkgname}-${_commit}.tar.gz::https://cgit.ctu.cx/${pkgname}/snapshot/${pkgname}-${_commit}.tar.gz")
sha256sums=('ed722a339694088fba05f85c1f17f00b52067ccf8d9d7dfbbffdd82707024e49')

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
