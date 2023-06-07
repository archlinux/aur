#Contributor: tantalum <tantalum at online dot de>
pkgname=pfds-guile-git
pkgver=20140711
pkgrel=1
pkgdesc="Purely Functional Data Structures in Scheme. Installs the files for use with Guile."
arch=(any)
url="https://github.com/ijp/pfds"
license=(custom)
depends=("guile>=2")
makedepends=(git)
conflicts=(pfds-guile)
provides=(pfds-guile)
_gitname=pfds
_gitroot="https://github.com/ijp"
source=(git+$_gitroot/$_gitname)
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git log -1 --format='%cd' --date=short | tr -d -- '-'
}
package() {
  cd "$srcdir/$_gitname"
  t="$pkgdir/usr/share/guile/site/$_gitname"
  install -d "$t"
  install -d "$t/private"
  # guile doesn't look for files with the .sls extension by default
  for k in *.sls private/*.sls; do
    cp -r "$k" "$t/${k%.sls}.scm"
  done
}
