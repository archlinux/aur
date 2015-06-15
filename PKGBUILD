# Maintainer: Moritz Lipp <mlq@pwmt.org>

pkgname=roundup-hg
_pkgname=roundup
pkgver=r4849.e68920390aad
pkgrel=1
pkgdesc="Issue tracking system."
arch=('any')
url="http://www.roundup-tracker.org"
license="PSF"
groups=()
depends=('python2')
makedepends=('mercurial' 'sed')
conflicts=('roundup')
source=("${_pkgname}::hg+http://hg.code.sf.net/p/${_pkgname}/code")
sha1sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  python2 setup.py install --prefix="/usr" --root="$pkgdir" --optimize=1
  sed -i -e "s|$pkgdir||" "$pkgdir"/usr/bin/*
}

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

# vim:set ts=2 sw=2 et:
