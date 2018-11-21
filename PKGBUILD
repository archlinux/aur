pkgname=picard-git
pkgver=2.0.5dev1.r304.gfa693041
pkgrel=1
pkgdesc="MusicBrainz tagging application"
arch=('i686' 'x86_64')
url="https://picard.musicbrainz.org"
license=('GPL')
depends=('python-pyqt5' 'python-mutagen')
optdepends=('python-discid: CD-Lookup feature'
            'chromaprint: AcoustID integration'
            'qt5-translations: Translated Qt5 components')
makedepends=('git')
provides=("picard=$pkgver")
conflicts=('picard' 'picard-qt' 'picard-bzr')
source=('git+https://github.com/metabrainz/picard.git')
md5sums=('SKIP')

pkgver(){
    cd "$srcdir/picard"
    git describe --tags --always | sed -r 's|release-||g;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/picard"
    python setup.py build --disable-autoupdate
}

check() {
    cd "$srcdir/picard"
    python setup.py test
}

package() {
    cd "$srcdir/picard"
    python setup.py install --skip-build --root=$pkgdir --optimize=1
}
