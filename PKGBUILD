# Maintainer: Jiuyang Liu <liujiuyang1994@gmail.com>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>
# Contributor: Guillaume Raffin ("theelectronwill") <theelectronwill@gmail.com>

pkgname=mill-git
pkgver=0
pkgrel=1
pkgdesc="Your shiny new Java/Scala build tool"
arch=(any)
url="http://www.lihaoyi.com/mill/index.html"
license=('MIT')
makedepends=('mill' 'scala')
depends=('bash' 'java-environment')
source=("git+https://github.com/lihaoyi/mill.git")
md5sums=('SKIP')

pkgver() {
  cd $srcdir/mill
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/mill
  mill -i all __.publishLocal release
}

package() {
  install -Dm755 "$srcdir"/mill/out/release/dest/mill "$pkgdir"/usr/bin/mill
  install -Dm644 "$srcdir"/mill/LICENSE "$pkgdir"/usr/share/licenses/mill/LICENSE
}
