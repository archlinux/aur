# Maintainer: Jiuyang Liu <liujiuyang1994@gmail.com>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>
# Contributor: Guillaume Raffin ("theelectronwill") <theelectronwill@gmail.com>

_pkgname=mill
pkgname=mill-git
pkgver=r1232.de22b577
pkgrel=1
pkgdesc="Your shiny new Java/Scala build tool"
arch=(any)
url="http://www.lihaoyi.com/mill/index.html"
license=('MIT')
makedepends=('mill' 'scala')
depends=('bash' 'java-environment')
replaces=('mill')
provides=('mill')
source=("git+https://github.com/lihaoyi/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/$_pkgname
  $_pkgname -i all __.publishLocal assembly
}

package() {
  install -Dm755 "$srcdir"/$_pkgname/out/assembly/dest/$_pkgname "$pkgdir"/usr/bin/$_pkgname
  install -Dm644 "$srcdir"/$_pkgname/LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
}
