# Maintainer: Jiuyang Liu <liujiuyang1994@gmail.com>

_pkgname=ammonite
_scalaversion=2.12.10
pkgname=ammonite-git
pkgver=r2253.fe66234e
pkgrel=1
pkgdesc="Scala Scripting"
arch=(any)
url="http://$_pkgname.io"
license=('MIT')
makedepends=('mill' 'scala')
depends=('bash' 'java-environment')
replaces=('$_pkgname')
source=("git+https://github.com/lihaoyi/ammonite.git")
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/$_pkgname
  mill -i amm[$_scalaversion].launcher
}

package() {
  install -Dm755 "$srcdir"/$_pkgname/out/amm/$_scalaversion/launcher/dest/run "$pkgdir"/usr/bin/amm
  install -Dm644 "$srcdir"/$_pkgname/LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
}
