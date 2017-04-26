# Maintainer: Frederik "Freso" S. Olesen <archlinux@freso.dk>
# Contributor: Bastien Traverse <firstname at lastname dot email>
# Contributor: Samantha Baldwin <fuhsaz+git@cryptic.li>
# Contributor: Caleb Reach <jtxx000@gmail.com>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: Karol "Kenji Takahashi" Woźniak <kenji.sx>
# Contributor: Mantas Mikulėnas <grawity@gmail.com>

pkgname=whipper
pkgver=0.5.1
pkgrel=2
pkgdesc="A Unix CD ripper aiming for accuracy over speed -- forked from morituri"
arch=('any')
url="https://github.com/JoeLametta/whipper"
license=('GPL3')
depends=(
    'accuraterip-checksum'          # for accuraterip-checksum calculation
    'cddb-py'                       # for showing but not using disc info if not in MusicBrainz (issue #28)
    'cdparanoia'                    # for the actual ripping
    'cdrdao'                        # for session, TOC, pregap, and ISRC extraction
    'libsndfile'                    # for reading wav files (pulls in flac, also required for reading flac files)
    'mutagen'                       # for metadata handling
    'python2-musicbrainzngs'        # for metadata lookup
    'python2-pycdio'                # for storing drive identification in config file
    'python2-setuptools'            # for plugin support
    'sox'                           # for track peak detection'
    )
makedepends=(
    'python2-gobject2'
    )
checkdepends=(
    'python2-twisted'
    )
conflicts=('morituri')
source=("${pkgname}-v${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('0df0cd9934c344617a15c12f21e333d7b5d270c904d70df9930b24188c5657aed8bedd202acda59990143fafe9c27b2ee880939d034be52259cc143423d04348')

check() {
    cd "$srcdir/${pkgname}-${pkgver}"
    python2 -m unittest discover
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}"/ --optimize=1
}
