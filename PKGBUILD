# Maintainer: Shashoto Nur <shashoto.nur@proton.me>

pkgname=kreuzer
pkgver=0.1.0
pkgrel=1
pkgdesc='Full-screen terminal tracker for income, expenses and budgets'
arch=('any')
url='https://github.com/shashotoNur/kreuzer'
license=('GPL-3.0-or-later')
depends=('bash>=4.4' 'gawk' 'coreutils' 'util-linux' 'findutils' 'grep' 'tar')
checkdepends=('bats')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# Placeholder: replaced by `updpkgsums` once the v$pkgver tag is pushed.
sha256sums=('9bdeb21ac5638b15ede1fce4ce50a28d6a60676c5e649df6a041bc4efc5dc04e')

check() {
  cd "$pkgname-$pkgver"
  make test
}

package() {
  cd "$pkgname-$pkgver"
  # The man page is generated and committed. Fail loudly if it is missing,
  # because `make install` would otherwise skip it silently.
  test -f man/kreuzer.1
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
