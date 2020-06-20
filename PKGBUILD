pkgname=picard-git
pkgver=2.3.2.r127.g1b845154
pkgrel=1
pkgdesc="MusicBrainz tagging application"
arch=('i686' 'x86_64')
url="https://picard.musicbrainz.org"
license=('GPL')
depends=('python-pyqt5' 'python-mutagen')
optdepends=('python-discid: CD-Lookup feature'
            'python-markdown: Scripting documentation'
            'chromaprint: AcoustID integration'
            'qt5-translations: Translated Qt5 components'
            'qt5-multimedia: Built‐in media player')
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
