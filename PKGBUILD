# Maintainer: peippo <christoph+aur@christophfink.com>
pkgname=duplicity-dev
pkgver=0.8.19
pkgrel=1
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
makedepends=(
    "python-setuptools"
    "python-setuptools-scm"
)

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
    "https://code.launchpad.net/duplicity/0.8-series/${pkgver}/+download/duplicity-${pkgver}.tar.gz"{,.sig}
)

sha512sums=(
    "c1a1f5894f8b94ac61bd98270f138c58ef5a68f3624e7e88224b15539ca6e08874df9cebb36b10167d133b1af6a93b29e7bf4084c348b9cd7914ff24415be57c"
    "SKIP"
)
validpgpkeys=(
    "9D95920CED4A8D5F8B086A9F8B6F8FF4E654E600"
)

build() {
	cd "duplicity-${pkgver}"
	python setup.py build
}

package() {
	cd "duplicity-${pkgver}"
	python setup.py install --root="${pkgdir}"

	# fix broken documentation permissions until upstream does (FS#27301)
	chmod -R +r "${pkgdir}/usr/share/doc"/duplicity-*
}
