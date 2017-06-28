# Maintainer: Max Bruckner (FSMaxB)
# Original author: archtux <antonio dot arias99999 at gmail dot com>

pkgname=freac
_realpkgver=20170317
pkgver=cvs_${_realpkgver}
pkgrel=3
pkgdesc="Audio converter and CD ripper with support for various popular formats and encoders."
arch=('i686' 'x86_64')
url="http://www.freac.org/"
license=('GPL2')
depends=('freac_cdk' 'mpg123' 'libvorbis' 'libsndfile' 'flac' 'lame' 'libfdk-aac' 'faac' 'faad2' 'opus' 'speex' 'libsamplerate' 'libmp4v2')

source=( "http://sourceforge.net/projects/bonkenc/files/snapshots/${_realpkgver}/freac-${_realpkgver}.tar.gz" freac.desktop help-path.patch)
sha512sums=('a416faf220459c5eba6718816991ace861d5895a63e1cf5e7968834248122f563c47b20361b26e604f1e02752ccfd5cec58cc16e47258ecdb505d015da4e3555'
            '61634e759c4621dee3485ef82c584faa6d8e4b67d5240a5b929b4b166913e6ea031d03a7fd85422d4422841700d6ab140b3815e12777c53c9254ebffeb8ae021'
            'b468313324929288f57af311767e85d603f04a09223bdb105584dab52dced2bd21468e6dca34e1e89e3c925609a4a71ff0b5c489317645bc04c571d962ca8588')

prepare() {
	cd "${pkgname/_/-}-${_realpkgver}" || exit 1
	find . -type f -exec sed -i 's!/usr/local!/usr!g' {} \;
	patch -p1 -i"$srcdir/help-path.patch" src/startgui.cpp
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
