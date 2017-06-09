# Maintainer: aksr <aksr at t-com dot me>
pkgname=dblp-refer-git
_pkgname=dblp-git
pkgver=r1.f2407f3
pkgrel=1
epoch=
pkgdesc="Convert DBLP search results to refer records "
arch=('i686' 'x86_64')
url="https://github.com/aligrudi/dblp"
license=('ISC')
categories=()
groups=()
depends=('')
makedepends=('git')
optdepends=('neatrefer-git: refer preprocessor for neatroff')
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
changelog=
install=
source=("$_pkgname::git+https://github.com/aligrudi/dblp.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  sed -i -e 's!>dblp.out!>/tmp/dblp.out!g' \
         -e 's!^\./dblp <dblp.out!dblp-refer </tmp/dblp.out!g' dblp.sh
  sed -i 's/\.\/dblp/dblp-refer/g' README
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 dblp $pkgdir/usr/bin/dblp-refer
  install -Dm755 dblp.sh $pkgdir/usr/bin/dblp-refer.sh
  install -Dm644 README $pkgdir/usr/share/doc/${pkgname%-*}/README
}

