pkgname=rover-bepo-git
_pkgname=rover
pkgver=v0.4.1.r4.gbdb6385
pkgrel=1
pkgdesc='Simple file browser for the terminal, bepo''s version.'
arch=('i686' 'x86_64')
url='https://github.com/StreakyCobra/rover'
license=('custom:Public Domain')
depends=('ncurses')
conflicts=('rover')
provides=('rover')
source=("${_pkgname}::git+https://github.com/StreakyCobra/${_pkgname}#branch=bepo")
sha256sums=('SKIP')
changelog="ChangeLog"

pkgver() {
    cd "${srcdir}/${_pkgname}/"

    git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}/"
  make
  sed -n '/All of the source code/,/warranty of any kind./p' README.md > LICENSE
}

package() {
  cd "${srcdir}/${_pkgname}/"
  make DESTDIR="$pkgdir" PREFIX='/usr' MANPREFIX='/usr/share/man' install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
