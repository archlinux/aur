# Maintainer: Bastien Traverse <firstname at lastname dot email>
# Contributor: Samantha Baldwin <fuhsaz+git@cryptic.li>
# Contributor: Frederik "Freso" S. Olesen <archlinux@freso.dk>
# Contributor: Caleb Reach <jtxx000@gmail.com>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: Karol "Kenji Takahashi" Woźniak <kenji.sx>
# Contributor: Mantas Mikulėnas <grawity@gmail.com>
# Based on community/morituri and aur/morituri-git PKGBUILDs

pkgname=whipper-git
pkgver=0.5.1.r0.g17b70ce
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
    'git'
    'python2-gobject2'
    )
checkdepends=(
    'python2-twisted'
    )
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'morituri')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    # Cutting off "v" prefix present in the git tag
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
    cd "$srcdir/${pkgname%-git}"
    python2 -m unittest discover
}

package() {
    cd "$srcdir/${pkgname%-git}"
    python2 setup.py install --root="${pkgdir}"/ --optimize=1
}
