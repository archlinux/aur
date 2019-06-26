# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jiuyang Liu <liujiuyang1994@gmail.com>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>
# Contributor: Guillaume Raffin ("theelectronwill") <theelectronwill@gmail.com>

pkgname=mill
pkgver=0.4.1
pkgrel=1
pkgdesc="Your shiny new Java/Scala build tool"
arch=(any)
url="http://www.lihaoyi.com/mill/index.html"
license=('MIT')
depends=('bash' 'java-environment')
makedepends=('mill' 'scala')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lihaoyi/mill/archive/$pkgver.tar.gz")
sha512sums=('SKIP')

prepare() {
  cd mill-$pkgver
  # workaround non-git build
  sed -e "s/'git/'true/" -e "s/^.*--exact-match.*$/\"$pkgver\"/" -i build.sc
}

build() {
  cd mill-$pkgver
  mill -i all __.publishLocal release
}

package() {
  cd mill-$pkgver
  install -Dm755 out/release/dest/mill "$pkgdir"/usr/bin/mill
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/mill/LICENSE
}
