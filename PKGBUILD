pkgname=picard-git
pkgver=1.3.2.r270.g34af84f
pkgrel=1
pkgdesc="MusicBrainz tagging application"
arch=('i686' 'x86_64')
url="https://picard.musicbrainz.org"
license=('GPL')
depends=('python2-pyqt4' 'mutagen')
optdepends=('python2-discid: CD-Lookup feature'
            'chromaprint: AcoustID integration')
makedepends=('git')
provides=('picard')
conflicts=('picard' 'picard-qt' 'picard-bzr')
source=('git://github.com/metabrainz/picard.git')
md5sums=('SKIP')

pkgver(){
    cd "$srcdir/picard"
    git describe --tags --always | sed -r 's|release-||g;s/([^-]*-g)/r\1/;s/-/./g'
}

check() {
    cd "$srcdir/picard"
    python2 setup.py build_ext -i
    python2 setup.py test
    rm picard/util/astrcmp.so
}

package() {
    cd "$srcdir/picard"
    python2 setup.py install --root=$pkgdir --optimize=1
    cp -r contrib/plugins/* "${pkgdir}/usr/lib/python2.7/site-packages/picard/plugins/"
}
