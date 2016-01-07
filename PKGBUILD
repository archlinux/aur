#contributor: tantalum <tantalum at online dot de>
pkgname=pfds-guile-git
pkgver=20130202
pkgrel=1
pkgdesc="Purely Functional Data Structures in Scheme. Installs the files for use with Guile."
arch=(any)
url="https://github.com/ijp/pfds"
license=(custom)
depends=("guile>=2")
makedepends=(git)
conflicts=(pfds-guile)
provides=()
source=()
md5sums=(SKIP)
_gitname=pfds
_gitroot="git://github.com/ijp"

build() {
    cd "$srcdir"
    msg "Connecting to GIT server..."
    if [ -d "$_gitname" ] ; then
	cd "$_gitname" && git pull origin
	cd "$srcdir"
	msg "The local files are updated."
    else
	git clone --depth=1 "$_gitroot/$_gitname"
    fi
    msg "GIT checkout done or server timeout"
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
