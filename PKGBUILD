# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: sysrq

pkgname=picard
pkgver=2.0.0beta3
pkgrel=1
pkgdesc='Official MusicBrainz tagger'
url='http://picard.musicbrainz.org/'
license=('GPL')
arch=('x86_64')
depends=('python-pyqt5' 'python-mutagen')
optdepends=('chromaprint: fingerprinting'
            'python-discid: cd lookup')
makedepends=('python-discid' 'git' 'python-setuptools')
#source=("http://ftp.musicbrainz.org/pub/musicbrainz/${pkgname}/${pkgname}-${pkgver}.tar.gz")
source=("git+https://github.com/metabrainz/picard.git#commit=3a41cebdbcff9af9791575d2e555c59201b55902")
sha256sums=('SKIP')

build() {
	cd "${srcdir}/picard"
	sed "s/‘/'/g" -i setup.cfg
	python setup.py config
}

package() {
	cd "${srcdir}/picard"
	python setup.py install --root="${pkgdir}"
	rm "${pkgdir}/usr/picard.in"
}
