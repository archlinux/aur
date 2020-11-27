# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jiuyang Liu <liujiuyang1994@gmail.com>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>
# Contributor: Guillaume Raffin ("theelectronwill") <theelectronwill@gmail.com>

pkgname=mill
pkgver=0.8.0_11
_pkgver=0.8.0
_commit=8cd135ad640b2732462739f6b104df4d3ac7edc1
pkgrel=2
pkgdesc="Your shiny new Java/Scala build tool"
arch=(any)
url="https://www.lihaoyi.com/mill/index.html"
license=('MIT')
depends=('bash' 'java-environment')
makedepends=('mill')
source=("$pkgname-$_commit.tar.gz::https://github.com/lihaoyi/mill/archive/$_commit.tar.gz")
sha512sums=('cfb71718aa500dda15f56012872934c2934b70eeb301bafe4c6defa9d1c58bf6ddd5a58eaedee82a8b8064f5f1d536e0fe255623f0f8323a9507b25504884af1')

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
