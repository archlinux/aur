# Maintainer: Evan Purkhiser <evanpurkhiser@gmail.com>
# Contributor: Jakub Kozisek <nodevel at gmail dot com>

_gitname=puddletag
pkgname=puddletag-git
pkgver=758.489acd2
pkgrel=1
pkgdesc="An audio tag editor for GNU/Linux."
arch=('i686' 'x86_64')
url="http://puddletag.sourceforge.net/"
license=('GPL')
depends=('python2' 'python2-pyqt' 'python2-pyparsing' 'mutagen' 'python2-configobj' 'python2-musicbrainz2')
makedepends=('git')
optdepends=('python2-imaging: edit/view FLAC cover art'
            'quodlibet: edit a QuodLibet library')
provides=('puddletag')
conflicts=('puddletag')
source=("git://github.com/keithgg/${_gitname}")
md5sums=(SKIP)

pkgver() {
    cd "$srcdir/$_gitname"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    cd "$srcdir/$_gitname/source"

    export PYTHONPATH="$pkgdir/usr/lib/python2.7/site-packages"
    mkdir -p "$PYTHONPATH"

    python2 setup.py config
    python2 setup.py install --prefix="$pkgdir/usr" --optimize=1 || return 1
}
