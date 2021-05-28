# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jiuyang Liu <liujiuyang1994@gmail.com>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>
# Contributor: Guillaume Raffin ("theelectronwill") <theelectronwill@gmail.com>

pkgname=mill
pkgver=0.9.8
pkgrel=1
pkgdesc="Your shiny new Java/Scala build tool"
arch=(any)
url="https://www.lihaoyi.com/mill/index.html"
license=('MIT')
depends=('bash' 'java-environment')
makedepends=('mill')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lihaoyi/mill/archive/$pkgver.tar.gz")
sha512sums=('71bf5fa07378e12239e9237d33a715c12bd05e7790d5a5504a49271b99b81bad9dad4a83f2fb15f7b06d08d961251dfaab8b19113e29fcb8d14f637712476738')

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
