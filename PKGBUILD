# Maintainer: Evan Purkhiser <evanpurkhiser@gmail.com>
# Contributor: Jakub Kozisek <nodevel at gmail dot com>

pkgname=puddletag-git
pkgdesc="An audio tag editor for GNU/Linux."
license=('GPL')
url="http://docs.puddletag.net/"
pkgver=758.489acd2
pkgrel=1

provides=('puddletag')
conflicts=('puddletag')

source=("$pkgname::git://github.com/keithgg/puddletag")
md5sums=('SKIP')
depends=('python2' 'mutagen' 'python2-pyqt' 'python2-pyparsing' 'python2-configobj' 'python2-musicbrainz2')
makedepends=('git')
optdepends=('python2-imaging: edit/view FLAC cover art'
            'quodlibet: edit a QuodLibet library')
arch=('i686' 'x86_64')

pkgver() {
    cd "$srcdir/$pkgname"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    cd "$srcdir/$pkgname/source"

    export PYTHONPATH="$pkgdir/usr/lib/python2.7/site-packages"
    mkdir -p "$PYTHONPATH"

    python2 setup.py config
    python2 setup.py install --prefix="$pkgdir/usr" --optimize=1 || return 1
}
