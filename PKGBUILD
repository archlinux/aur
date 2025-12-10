# Contributor: codl <codl@codl.fr>
# Contributor: Michael Lawson <mdlawson@gmx.com>

pkgname=ibus-uniemoji-git
_gitname=ibus-uniemoji
pkgver=0.7.0.r3.g0e75587
pkgrel=1
pkgdesc="A simple input method for ibus that allows you to enter unicode emoji and other symbols by name"
arch=(any)
url="https://github.com/salty-horse/ibus-uniemoji"
license=('GPL-3.0-or-later' 'MIT' 'Unicode-3.0')
depends=('python' 'python-gobject' 'libibus')
makedepends=('git')
provides=('ibus-uniemoji')
conflicts=('ibus-uniemoji')
optdepends=(
    'python-levenshtein:  faster fuzzy search'
    'python-pyxdg: freedesktop.org standards support'
)
source=("git+${url}.git")
md5sums=("SKIP")

pkgver() {
    cd "${srcdir}/${_gitname}"
    git describe --tags | sed -r 's/^v//;s/-([0-9]+)-g/.r\1.g/'
}

build() {
    cd "$srcdir/$_gitname"
    PREFIX="/usr" SYSCONFDIR="/etc" make all
}

package() {
    cd "$srcdir/$_gitname"
    PREFIX="/usr" SYSCONFDIR="/etc" DESTDIR="$pkgdir/" make install
    install -Dm644 COPYING.{unicode,joypixels_emoji} -t "$pkgdir/usr/share/licenses/$pkgname"
}
