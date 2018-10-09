# Maintainer: ObserverOfTime <chronobserver@disroot.org>

_pkgname=git-open
pkgname=git-open-git
pkgver=r200.4ca1990
pkgrel=1
pkgdesc='Open a repo website in your browser. Development version.'
arch=('any')
url='https://github.com/paulirish/git-open'
license=('MIT')
depends=('git' 'xdg-utils')
makedepends=('npm') # You can replace npm with yarn if you prefer
conflicts=('nodejs-git-open' 'git-open')
source=('git://github.com/paulirish/git-open')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  ${makedepends[0]} install
  ${makedepends[0]} run man
}

package() {
  cd "$srcdir/$_pkgname"
  mkdir -p "$pkgdir/usr/bin"
  install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 $_pkgname.1 "$pkgdir/usr/share/man/man1/$_pkgname.1"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

# vim:set et sw=2 ts=2:

