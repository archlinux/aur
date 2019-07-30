# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jiuyang Liu <liujiuyang1994@gmail.com>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>
# Contributor: Guillaume Raffin ("theelectronwill") <theelectronwill@gmail.com>

pkgname=mill
pkgver=0.5.0
pkgrel=1
pkgdesc="Your shiny new Java/Scala build tool"
arch=(any)
url="http://www.lihaoyi.com/mill/index.html"
license=('MIT')
depends=('bash' 'java-environment')
makedepends=('mill' 'scala')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lihaoyi/mill/archive/$pkgver.tar.gz")
sha512sums=('c43d383f78cf363ee91dfc0183956c3032e9e74d1c9d8fcd866cab0b015203b9bb1d658ea088ae52ea8ee8bb16451ce712ef6d20d97600fd39ecb55457bcaec7')

prepare() {
  cd mill-$pkgver
  # workaround non-git build
  sed -e "s/'git/'true/" -e "s/^.*--exact-match.*$/\"$pkgver\"/" -i build.sc
}

build() {
  cd mill-$pkgver
  mill -i all __.publishLocal assembly
}

package() {
  cd mill-$pkgver
  install -Dm755 out/assembly/dest/mill "$pkgdir"/usr/bin/mill
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/mill/LICENSE
}
