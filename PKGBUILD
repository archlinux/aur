pkgname=smartie-pwa
pkgver=0.1
pkgrel=6
arch=('x86_64')
pkgdesc="smarthome web-gui"
url="https://cgit.ctu.cx/${pkgname}"
license=( 'GPL-3' )
depends=( 'glibc' )
makedepends=( 'yarn' 'git' )
_commit="3fe40dfd8211f05751c3df98402eb2367636a6f7"
source=("${pkgname}-${_commit}.tar.gz::https://cgit.ctu.cx/${pkgname}/snapshot/${pkgname}-${_commit}.tar.gz")
sha256sums=('5bd64cf5644322514d71563c8d8f125f99761da53a5592eacdad67193dcf7ce9')

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
