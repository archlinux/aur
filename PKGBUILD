# Maintainer: peippo <christoph+aur@christophfink.com>
pkgname=duplicity-dev
pkgver=0.8.15
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
    "2d048377c839ae56fc2828997c9aa7ba8c339e815e1e2ae738652037508ec276a2c72583687da34408fadd4839011e242b51bc73cca954227fc51db5683c258c"
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
