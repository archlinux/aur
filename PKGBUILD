# Maintainer: Martchus <martchus@gmx.net>
# Contributor: Mladen Milinkovic <maxrd2@smoothware.net>

# You can install/update Subtitle Composer from repository if you add following to /etc/pacman.conf
# [subtitlecomposer]
# # Subtitle Composer
# SigLevel = PackageRequired
# Server = http://smoothware.net/$repo/$arch

pkgname=subtitlecomposer
pkgver=0.5.7
pkgrel=2
pkgdesc="A KDE subtitle editor"
arch=('i686' 'x86_64')
url="https://github.com/maxrd2/subtitlecomposer"
license=('GPL')
depends=('kdelibs' 'gettext')
makedepends=('cmake' 'automoc4' 'git')
conflicts=('subtitlecomposer-git')
optdepends=(
    'mplayer: for MPlayer backend'
    'mplayer2: for MPlayer backend'
    'gstreamer: for GStreamer backend'
    'xine-lib: for Xine backend'
    )
source=("https://github.com/maxrd2/subtitlecomposer/archive/v${pkgver}.tar.gz")
md5sums=('9e1fef4dca5a15e5c0435f1b099d4ab4')

build() {
    cd ${srcdir}/subtitlecomposer-${pkgver}
    cmake -DCMAKE_INSTALL_PREFIX=/usr
    # workaround for "gst/gstconfig.h: No such file or directory"
    export CPATH=/usr/lib64/gstreamer-1.0/include
    make
}

package() {
    cd ${srcdir}/subtitlecomposer-${pkgver}
    make DESTDIR=${pkgdir} install
} 
