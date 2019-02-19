# Maintainer: Frederik "Freso" S. Olesen <archlinux@freso.dk>
# Contributor: Bastien Traverse <firstname at lastname dot email>
# Contributor: Samantha Baldwin <fuhsaz+git@cryptic.li>
# Contributor: Caleb Reach <jtxx000@gmail.com>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: Karol "Kenji Takahashi" Woźniak <kenji.sx>
# Contributor: Mantas Mikulėnas <grawity@gmail.com>
# Based on community/morituri and aur/morituri-git PKGBUILDs

pkgname=whipper-git
pkgver=0.7.3.r2.g752b485
pkgrel=1
pkgdesc='A Unix CD ripper aiming for accuracy over speed -- forked from morituri'
arch=('any')
url='https://github.com/whipper-team/whipper'
license=('GPL3')
depends=(
    'accuraterip-checksum'          # for accuraterip-checksum calculation
    'cdrdao'                        # for session, TOC, pregap, and ISRC extraction
    'flac'                          # for reading flac files
    'libcdio-paranoia'              # for the actual ripping
    'libsndfile'                    # for reading wav files
    'python2-mutagen'               # for metadata handling
    'python2-musicbrainzngs'        # for metadata lookup
    'python2-gobject'
    'python2-pycdio'                # for storing drive identification in config file
    'python2-requests'              # for retrieving AccurateRip database entries
    'python2-setuptools'            # for plugin support
    'sox'                           # for track peak detection'
    )
makedepends=(
    'git'
    )
checkdepends=(
    'python2-twisted'
    )
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git#branch=develop")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    # Cutting off "v" prefix present in the git tag
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/${pkgname%-git}"
    python2 setup.py build
}

check() {
    cd "$srcdir/${pkgname%-git}"
    python2 -m unittest discover
}

package() {
    cd "$srcdir/${pkgname%-git}"
    python2 setup.py install --skip-build --root="${pkgdir}"/ --optimize=1
}
