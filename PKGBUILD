# Maintainer: Felipe Morales <hel.sheep@gmail.com>
_pkgname=plotinus
pkgname=$_pkgname-git
pkgver=r2.aa73741
pkgrel=1
pkgdesc="A searchable command palette in every modern GTK+ application"
arch=(any)
url="http://github.com/p-e-w/plotinus"
license=('GPL')
groups=()
makedepends=('git' 'vala' 'cmake')
depends=('gtk3')
source=(
  'git://github.com/p-e-w/plotinus.git'
  'plotinus.sh'
  )
md5sums=(
  'SKIP'
  '6ad4e0036eba28de03cee657287dbfe2'
  )

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$_pkgname"
  cmake .
  make
}

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/etc/profile.d"
  install -m 644 plotinus.sh "$pkgdir/etc/profile.d"

  cd "$_pkgname"
  mkdir -p "$pkgdir/usr/lib"
  install -m 644 libplotinus.so "$pkgdir/usr/lib"
}

# vim:set ts=2 sw=2 et:
