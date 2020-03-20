# Maintainer: peippo <christoph+aur@christophfink.com>
pkgname=duplicity-dev
pkgver=0.8.12
_pkgversuffix="1612"
_pkgver="${pkgver}.${_pkgversuffix}"
pkgrel=0
pkgdesc="A utility for encrypted, bandwidth-efficient backups using the rsync algorithm"
arch=("x86_64")
url="http://duplicity.nongnu.org/"
license=("GPL")
depends=(
	"librsync"
	"python-fasteners"
	"python-future"
	"python-requests"
	"python-urllib3"
)
makedepends=("python-setuptools")
# Note: these are based entirely on the requirements.txt file.
# Install whatever ones you need for your use case.
optdepends=(
	"python-azure"
	"python-b2sdk"
	"python-boto"
	"python-paramiko"
	"python-pydrive"
	"python-swiftclient"
	"python-requests-oauthlib"
)
provides=("duplicity")
conflicts=("duplicity")

source=(
    "https://code.launchpad.net/duplicity/0.8-series/$pkgver/+download/duplicity-${_pkgver}.tar.gz"{,.sig}
)

sha512sums=(
    "eac4d1aecd604ece123bd3b5cecd3b65e1213c243db1a3ce25bae58360d666dd1db07ba0a137e7682f99775ece20453c7dc44cd87940b56c0acd05d01149c951"
    "SKIP"
)
validpgpkeys=(
    "9D95920CED4A8D5F8B086A9F8B6F8FF4E654E600"
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
