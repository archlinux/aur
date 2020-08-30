# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: sysrq

pkgname=picard
pkgver=2.4.1
pkgrel=3
pkgdesc='Official MusicBrainz tagger'
url='https://picard.musicbrainz.org/'
license=('GPL')
arch=('x86_64')
depends=('python-pyqt5' 'python-mutagen' 'python-dateutil')
optdepends=('chromaprint: fingerprinting'
            'python-discid: cd lookup'
            'python-markdown: doc rendering'
            'qt5-multimedia: media player toolbar'
            'qt5-translations: full UI translation')
makedepends=('git' 'python-setuptools')
#source=("git+https://github.com/metabrainz/picard.git#tag=release-$pkgver?signed")
source=("git+https://github.com/metabrainz/picard.git#commit=9abd145914561399f0da69b9be93995414007032")
validpgpkeys=('9FD61CE6F154EC5A3531D0DE23A723D6417E5D5A')
sha256sums=('SKIP')

build() {
	cd "${srcdir}/${pkgname}"
	sed "s/‘/'/g" -i setup.cfg
	python setup.py config
}

package() {
	cd "${srcdir}/${pkgname}"
	python setup.py install \
		--root="${pkgdir}" \
		--disable-autoupdate \

	rm -fr "${pkgdir}"/usr/lib/python*/site-packages/picard-*.egg-info
}
