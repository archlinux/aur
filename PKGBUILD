# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jiuyang Liu <liujiuyang1994@gmail.com>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>
# Contributor: Guillaume Raffin ("theelectronwill") <theelectronwill@gmail.com>

pkgname=mill
pkgver=0.9.10
pkgrel=1
pkgdesc="Your shiny new Java/Scala build tool"
arch=(any)
url="https://www.lihaoyi.com/mill/index.html"
license=('MIT')
depends=('bash' 'java-environment')
makedepends=('mill')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lihaoyi/mill/archive/$pkgver.tar.gz")
sha512sums=('ed15e10e092c51c45c554b3b341307782ec6e6086573cfd33638d9088b5f5d3abc4c57cee2da213f99be4113600fcd95d9caba6f10d8bbd09d9ea93011ed6229')

prepare() {
  cd mill-$pkgver
  # workaround non-git build
  sed -e "s/VcsVersion.vcsState().format()/\"$pkgver\"/;s/VcsVersion.vcsState().lastTag.get/\"$pkgver\"/" -i build.sc
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
