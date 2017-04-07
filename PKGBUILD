pkgname=picard-git
pkgver=1.4.1.r111.g4f759c7d
pkgrel=1
pkgdesc="MusicBrainz tagging application"
arch=('i686' 'x86_64')
url="https://picard.musicbrainz.org"
license=('GPL')
depends=('python-pyqt5' 'python-mutagen')
optdepends=('python-discid: CD-Lookup feature'
            'chromaprint: AcoustID integration')
makedepends=('git')
provides=("picard=$pkgver")
conflicts=('picard' 'picard-qt' 'picard-bzr')
source=('git+https://github.com/metabrainz/picard.git')
md5sums=('SKIP')

pkgver(){
    cd "$srcdir/picard"
    git describe --tags --always | sed -r 's|release-||g;s/([^-]*-g)/r\1/;s/-/./g'
}

check() {
    cd "$srcdir/picard"
    python setup.py build_ext -i
    python setup.py test
}

package() {
    cd "$srcdir/picard"
    python setup.py install --root=$pkgdir --optimize=1
}
