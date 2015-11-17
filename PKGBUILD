# Maintainer: Jon Gjengset <jon@thesquareplanet.com>
pkgname=cpubars-git
pkgver=r27.6deab3e
pkgrel=1
pkgdesc="lightweight terminal-based multicore CPU usage monitor"
arch=('any')
url="https://github.com/aclements/cpubars"
license=('MIT')
depends=('ncurses')
makedepends=('git')
source=("${pkgname}::git+https://github.com/aclements/cpubars.git" 'include-time.patch')
md5sums=('SKIP'
         '6f6e0e92c6424d5785c901a0d300c7b7')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  patch -Np1 -i "${srcdir}/include-time.patch"
}

build() {
  cd "$srcdir/$pkgname"
  make cpubars
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "$srcdir/$pkgname/cpubars" "$pkgdir/usr/bin/cpubars"
}

# vim:set ts=2 sw=2 et:
