# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=hermetic-git
pkgver=20150624
pkgrel=1
pkgdesc="a python-like language with hindley-milner-like type system, which is compiled to c"
url="https://github.com/alehander42/hermetic"
arch=('any')
license=("custom")
depends=('python' 'gcc')
makedepends=('git')
source=('git://github.com/alehander42/hermetic.git')
md5sums=('SKIP')

_gitname="hermetic"
_site="usr/lib/python3.4/site-packages"

pkgver() {
  cd "$srcdir/$_gitname"
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

build() {
  cd "$srcdir/$_gitname"
  sed -i "s|'core'|'/$_site/hermetic/core'|" hermetic/c_generator.py
}

package() {
  cd "$srcdir/$_gitname"

  install -Dm755 bin/hermetic "$pkgdir/usr/bin/hermetic"

  install -d "$pkgdir/$_site/hermetic/core"
  cp -r hermetic/* "$pkgdir/$_site/hermetic/"
  cp core/* "$pkgdir/$_site/hermetic/core/"

  install -d "$pkgdir/usr/share/doc/hermetic/examples"
  cp examples/* "$pkgdir/usr/share/doc/hermetic/examples/"
}
