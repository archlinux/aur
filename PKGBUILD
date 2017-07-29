# Maintainer: Max Bruckner (FSMaxB)
# Original author: archtux <antonio dot arias99999 at gmail dot com>

pkgname=freac
_realpkgver=20170729
pkgver=cvs_${_realpkgver}
pkgrel=1
pkgdesc="Audio converter and CD ripper with support for various popular formats and encoders."
arch=('i686' 'x86_64')
url="http://www.freac.org/"
license=('GPL2')
depends=("freac_cdk>=$pkgver" 'mpg123' 'libvorbis' 'libsndfile' 'flac' 'lame' 'libfdk-aac' 'faac' 'faad2' 'opus' 'speex' 'libsamplerate' 'libmp4v2')

source=( "http://sourceforge.net/projects/bonkenc/files/snapshots/${_realpkgver}/freac-${_realpkgver}.tar.gz" freac.desktop)
sha512sums=('8c1fa8f7868d6bf09f87ed619cfef1aec6f01ee1d932bf965249f27ba5eb3d3a07b3b861ef9b41003be89fc531f4603c836a1e98267530ba9600bc1f85d06966'
'61634e759c4621dee3485ef82c584faa6d8e4b67d5240a5b929b4b166913e6ea031d03a7fd85422d4422841700d6ab140b3815e12777c53c9254ebffeb8ae021')

prepare() {
	cd "${pkgname/_/-}-${_realpkgver}" || exit 1
	find . -type f -exec sed -i 's!/usr/local!/usr!g' {} \;
}

build() {
	cd "${pkgname/_/-}-${_realpkgver}" || exit 1
	make
}

package() {
	cd "${pkgname/_/-}-${_realpkgver}" || exit 1
	make DESTDIR="$pkgdir/" install

	# Desktop icon
	install -Dm644 bin/icons/freac.png "$pkgdir/usr/share/pixmaps/freac.png"
	install -Dm644 "$srcdir/freac.desktop" "$pkgdir/usr/share/applications/freac.desktop"
}
