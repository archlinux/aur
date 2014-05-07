# Maintainer: Jakub Kozisek <nodevel at gmail dot com>
# Contributor: Evan Purkhiser <evanpurkhiser@gmail.com>

pkgname=puddletag-hg
pkgver=r725.e0d8de5bb328
pkgrel=1
pkgdesc="An audio tag editor for GNU/Linux."
arch=('i686' 'x86_64')
url="http://puddletag.sourceforge.net/"
license=('GPL')
depends=('python2' 'python2-pyqt' 'python2-pyparsing' 'mutagen' 'python2-configobj' 'python2-musicbrainz2')
makedepends=('mercurial')
optdepends=('python2-imaging: edit/view FLAC cover art'
            'quodlibet: edit a QuodLibet library')
provides=('puddletag')
conflicts=('puddletag')
source=($pkgname::hg+http://hg.code.sf.net/p/puddletag/code)
md5sums=(SKIP)

pkgver() {
    cd "$srcdir/$pkgname/source"
    printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

package() {
    cd "$srcdir/$pkgname/source"
    python2 setup.py config
    python2 setup.py install --prefix="$pkgdir/usr" --optimize=1 || return 1
}
