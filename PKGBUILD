# Maintainer: peippo <christoph.fink@gmail.com>
pkgname=duplicity-dev
pkgver=0.8.10fin1558
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
    "https://code.launchpad.net/duplicity/0.8-series/$pkgver/+download/duplicity-$pkgver.tar.gz"{,.sig}
)

sha512sums=(
    '03c35fe6f7c542de96b53642fdf620c30848ffd753c49fdf2220c2dfcbdc09ff1394a660f92a61709ec4a105784c35bde571e3e92bd72634241cc1a04a5b84cb'
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
	chmod -R +r "$pkgdir/usr/share/doc/duplicity-"*
}
