# Maintainer: Jiuyang Liu <liujiuyang1994@gmail.com>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>
# Contributor: Guillaume Raffin ("theelectronwill") <theelectronwill@gmail.com>

_pkgname=mill
pkgname=mill-git
pkgver=r1367.fb6fee27
pkgrel=1
pkgdesc="Your shiny new Java/Scala build tool"
arch=(any)
url="http://www.lihaoyi.com/mill/index.html"
license=('MIT')
makedepends=('mill')
depends=('bash' 'java-environment')
replaces=('mill')
provides=('mill')
source=("git+https://github.com/lihaoyi/$_pkgname.git"
        "https://raw.githubusercontent.com/lefou/mill-bash-completion/master/mill.complete.sh")
md5sums=('SKIP'
         'SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare() {
  export _JAVA_OPTIONS=-Duser.home=/tmp
}
build() {
  cd $srcdir/$_pkgname
  mill -i all __.publishLocal assembly
}

package() {
  install -Dm755 $srcdir/$_pkgname/out/assembly/dest/$_pkgname $pkgdir/usr/bin/$_pkgname
  install -Dm644 $srcdir/mill.complete.sh $pkgdir/usr/share/bash-completion/completions/mill
  install -Dm644 $srcdir/$_pkgname/LICENSE $pkgdir/usr/share/licenses/$_pkgname/LICENSE
}
