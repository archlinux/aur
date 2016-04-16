# Maintainer: Erikas Rudinskas (erikmnkl@gmail.com)
#
# All credits goes to:
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: boromil@gmail.com

pkgname=thunar-thumbnailers
pkgver=0.4.1
pkgrel=1
pkgdesc="Provides additional thumbnailers for Thunar. Patched to support OpenRaster"
url="http://goodies.xfce.org/projects/thunar-plugins/thunar-thumbnailers/"
license=('GPL2')
arch=('i686' 'x86_64')
groups=('xfce4-goodies')
depends=('imagemagick' 'ffmpegthumbnailer')
optdepends=('raw-thumbnailer: support for Raw Digital Camera Images'
	'dcraw: support for Raw Digital Camera Image')
makedepends=('raw-thumbnailer' 'dcraw' 'unzip')
conflicts=('thunar-thumbnailers')
options=('!libtool')
install=thunar-thumbnailers.install
source=(http://archive.xfce.org/src/apps/thunar-thumbnailers/0.4/$pkgname-$pkgver.tar.bz2)
sha256sums=('7b37531de23adb35ef183ccb0a970e916a8cd78dddd840adbf2970b941524209')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr --enable-ffmpeg --enable-raw \
        --libexecdir=/usr/lib/xfce4
    make || return 1

}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR=$pkgdir install || return 1
}