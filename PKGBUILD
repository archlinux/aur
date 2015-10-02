# Maintainer: Michael Lawson <mdlawson@gmx.com>

pkgname=ibus-uniemoji-git
_gitname=ibus-uniemoji
pkgver=0.3.0.2.ga30c63f
pkgrel=1
pkgdesc="A simple input method for ibus that allows you to enter unicode emoji and other symbols by name (git-version)"
arch=(i686 x86_64)
url="https://github.com/lalomartins/ibus-uniemoji"
license=('GPL')
depends=('python' 'libibus')
makedepends=('git')
provides=('ibus-uniemoji')
optdepends=('python-levenshtein:  faster fuzzy search')
source=("git://github.com/lalomartins/ibus-uniemoji")
md5sums=("SKIP")

pkgver() {
    cd "${srcdir}/${_gitname}"
    git describe --tags | sed -e 's:v::' -e 's/-/./g'
}

package() {
    cd "$srcdir/$_gitname"
    mkdir -p $pkgdir/usr/share/ibus-uniemoji 
    cp uniemoji.py uniemoji.svg UnicodeData.txt $pkgdir/usr/share/ibus-uniemoji
    chmod a+x $pkgdir/usr/share/ibus-uniemoji/uniemoji.py
    mkdir -p $pkgdir/usr/share/ibus/component
    cp uniemoji.xml $pkgdir/usr/share/ibus/component
}
