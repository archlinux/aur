# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jiuyang Liu <liujiuyang1994@gmail.com>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>
# Contributor: Guillaume Raffin ("theelectronwill") <theelectronwill@gmail.com>

pkgname=mill
pkgver=0.9.4
pkgrel=1
pkgdesc="Your shiny new Java/Scala build tool"
arch=(any)
url="https://www.lihaoyi.com/mill/index.html"
license=('MIT')
depends=('bash' 'java-environment')
makedepends=('mill')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lihaoyi/mill/archive/$pkgver.tar.gz")
sha512sums=('442b73df51d8f8a5cdc59c1fa62b2dcd561f59decd4cceff928200a19b4a333e25737b21ce4a0a2acdc97caf2da67169271eeedd7ff78637a09be7e006b0b2c2')

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
