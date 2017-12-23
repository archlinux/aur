# Maintainer: codl <codl@codl.fr>
# Contributor: Michael Lawson <mdlawson@gmx.com>

pkgname=ibus-uniemoji-git
_gitname=ibus-uniemoji
pkgver=0.6.0.11.g6bc33a4
pkgrel=2
pkgdesc="A simple input method for ibus that allows you to enter unicode emoji and other symbols by name (git-version)"
arch=(i686 x86_64)
url="https://github.com/salty-horse/ibus-uniemoji"
license=('GPL')
depends=('python' 'libibus')
makedepends=('git')
provides=('ibus-uniemoji')
conflicts=('ibus-uniemoji')
optdepends=('python-levenshtein:  faster fuzzy search')
source=("git://github.com/salty-horse/ibus-uniemoji")
md5sums=("SKIP")

pkgver() {
    cd "${srcdir}/${_gitname}"
    git describe --tags | sed -e 's:v::' -e 's/-/./g'
}

build() {
    cd "$srcdir/$_gitname"
    env PREFIX="/usr" SYSCONFDIR="/etc" make all
}

package() {
    cd "$srcdir/$_gitname"
    env DESTDIR="$pkgdir/" make install
}
