# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jiuyang Liu <liujiuyang1994@gmail.com>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>
# Contributor: Guillaume Raffin ("theelectronwill") <theelectronwill@gmail.com>

pkgname=mill
pkgver=0.8.0_37
_pkgver=0.8.0
_commit=f7150b62690f305dc35f02d426561fad9274e4d2
pkgrel=1
pkgdesc="Your shiny new Java/Scala build tool"
arch=(any)
url="https://www.lihaoyi.com/mill/index.html"
license=('MIT')
depends=('bash' 'java-environment')
makedepends=('mill')
source=("$pkgname-$_commit.tar.gz::https://github.com/lihaoyi/mill/archive/$_commit.tar.gz")
sha512sums=('381a10ce8faea421d145c32150e5a5649d88e229ce16543b2bb87751f3314669a2343488dbe557e640e9f4362e06246b5dbed93e7b0d4514cf50558d1236c885')

prepare() {
  cd mill-$_commit
  # workaround non-git build
  sed -e "s/'git/'true/" -e "s/^.*--exact-match.*$/\"$_pkgver\"/" -i build.sc
}

build() {
  cd mill-$_commit
  mill -i all __.publishLocal assembly
}

package() {
  cd mill-$_commit
  install -Dm755 out/assembly/dest/mill "$pkgdir"/usr/bin/mill
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/mill/LICENSE
}
