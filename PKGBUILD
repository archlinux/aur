# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: sysrq

pkgname=picard
pkgver=2.1
_pkgver=${pkgver}.0
pkgrel=1
pkgdesc='Official MusicBrainz tagger'
url='https://picard.musicbrainz.org/'
license=('GPL')
arch=('x86_64')
depends=('python-pyqt5' 'python-mutagen')
optdepends=('chromaprint: fingerprinting'
            'python-discid: cd lookup')
makedepends=('python-discid' 'git' 'python-setuptools')
source=("http://ftp.musicbrainz.org/pub/musicbrainz/${pkgname}/${pkgname}-${pkgver}.tar.gz")
#source=("git+https://github.com/metabrainz/picard.git#commit=3a41cebdbcff9af9791575d2e555c59201b55902")
sha256sums=('cc00d51b8897cfe4a27e5ccd845a48e8eacffcbc96d0fa652a180954f0198a14')

build() {
	cd "${srcdir}/picard-release-${_pkgver}"
	sed "s/‘/'/g" -i setup.cfg
	python setup.py config
}

package() {
	cd "${srcdir}/picard-release-${_pkgver}"
	python setup.py install \
		--root="${pkgdir}" \
		--disable-autoupdate \

	rm -fr "${pkgdir}"/usr/lib/python*/site-packages/picard-*.egg-info
}
