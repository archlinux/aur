# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jiuyang Liu <liujiuyang1994@gmail.com>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>
# Contributor: Guillaume Raffin ("theelectronwill") <theelectronwill@gmail.com>

pkgname=mill
pkgver=0.9.7
pkgrel=1
pkgdesc="Your shiny new Java/Scala build tool"
arch=(any)
url="https://www.lihaoyi.com/mill/index.html"
license=('MIT')
depends=('bash' 'java-environment')
makedepends=('mill')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lihaoyi/mill/archive/$pkgver.tar.gz")
sha512sums=('8c2c5e3648e1fd0e0df9799e8df1b0589f2f19e511377912310cc7ad4fa2efb2270121aa8004f00ca4f1f66170dbdb3642c197f5b9314d02a1b39d914319310d')

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
