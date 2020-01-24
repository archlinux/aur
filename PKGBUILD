# Maintainer: peippo <christoph.fink@gmail.com>
pkgname=duplicity-dev
pkgver=0.8.09
pkgrel=0
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
    "https://code.launchpad.net/duplicity/0.8-series/$pkgver/+download/duplicity-$pkgver.tar.gz"{,.asc}
)

sha512sums=(
    'e4045a1c1adbf0927ee5325f02b79e7c0b38034080be4b563f20f1af593c8c1943a772fe7f212730e60f7c7cee93756426fe769a62050d42651fd1af7f6ba50a'
    'SKIP'
)
validpgpkeys=(
    '9D95920CED4A8D5F8B086A9F8B6F8FF4E654E600'
)

build() {
	cd "duplicity-$pkgver"
	python setup.py build
}

package() {
	cd "duplicity-$pkgver"
	python setup.py install --root="$pkgdir"

	# fix broken documentation permissions until upstream does (FS#27301)
	chmod -R +r "$pkgdir/usr/share/doc/duplicity-$pkgver"
}
