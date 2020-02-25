# Maintainer: peippo <christoph.fink@gmail.com>
pkgname=duplicity-dev
pkgver=0.8.11
_pkgversuffix="1596"
_pkgver="${pkgver}.${_pkgversuffix}"
pkgrel=1
pkgdesc="A utility for encrypted, bandwidth-efficient backups using the rsync algorithm. Development version"
arch=(x86_64)
url="http://duplicity.nongnu.org/"
license=('GPL')
depends=(
	'librsync'
	'python-fasteners'
	'python-future'
	'python-requests'
	'python-urllib3'
)
makedepends=('python-setuptools')
# Note: these are based entirely on the requirements.txt file.
# Install whatever ones you need for your use case.
optdepends=(
	'python-azure'
	'python-b2sdk'
	'python-boto'
	'python-paramiko'
	'python-pydrive'
	'python-swiftclient'
	'python-requests-oauthlib'
)
provides=('duplicity')
conflicts=('duplicity')

source=(
    "https://code.launchpad.net/duplicity/0.8-series/$pkgver/+download/duplicity-${_pkgver}.tar.gz"{,.sig}
)

sha512sums=(
    '67940d73d8213559ba88ec21e1326aca0dd065888cbf2e3c68f0f515ba9246100fd6e6d0bd1f12cb678702559f2266b7905931506d2ff6fe6fd35c673593479b'
    'SKIP'
)
validpgpkeys=(
    '9D95920CED4A8D5F8B086A9F8B6F8FF4E654E600'
)

build() {
	cd "duplicity-${_pkgver}"
	python setup.py build
}

package() {
	cd "duplicity-${_pkgver}"
	python setup.py install --root="$pkgdir"

	# fix broken documentation permissions until upstream does (FS#27301)
	chmod -R +r "$pkgdir/usr/share/doc"/duplicity-*
}
