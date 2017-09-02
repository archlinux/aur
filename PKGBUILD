# Maintainer: Max Bruckner (FSMaxB)
# Original author: archtux <antonio dot arias99999 at gmail dot com>

pkgname=freac
_date=20170902
pkgver=1.1alpha_${_date}
pkgrel=1
pkgdesc="Audio converter and CD ripper with support for various popular formats and encoders."
arch=('i686' 'x86_64')
url="http://www.freac.org/"
license=('GPL2')
depends=("freac_cdk>=$pkgver" 'mpg123' 'libvorbis' 'libsndfile' 'flac' 'lame' 'libfdk-aac' 'faac' 'faad2' 'opus' 'speex' 'libsamplerate' 'libmp4v2')

source=( "http://sourceforge.net/projects/bonkenc/files/snapshots/${_date}/freac-1.1-alpha-${_date}.tar.gz" freac.desktop)
sha512sums=('826c468d99766ef2fa714ca90effcfa776d79919a7f39bdc17a6d488ffca1cc1e996ec4611f50bdc1a00139da09c0b602c0535734511649d6415a317b4447bf7'
            '61634e759c4621dee3485ef82c584faa6d8e4b67d5240a5b929b4b166913e6ea031d03a7fd85422d4422841700d6ab140b3815e12777c53c9254ebffeb8ae021')

prepare() {
	cd "${pkgname}-1.1-alpha-${_date}" || exit 1
	find . -type f -exec sed -i 's!/usr/local!/usr!g' {} \;
}

build() {
	cd "${pkgname}-1.1-alpha-${_date}" || exit 1
	make
}

package() {
	cd "${pkgname}-1.1-alpha-${_date}" || exit 1
	make DESTDIR="$pkgdir/" install

	# Desktop icon
	install -Dm644 bin/icons/freac.png "$pkgdir/usr/share/pixmaps/freac.png"
	install -Dm644 "$srcdir/freac.desktop" "$pkgdir/usr/share/applications/freac.desktop"
}
