# Maintainer: peippo <christoph+aur@christophfink.com>
pkgname=duplicity-dev
pkgver=0.8.13
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
    "71e07fa17dcf2002a0275bdf236c1b2c30143e276abfdee15e45a75f0adeefc9e784c76a578f90f6ed785f093f364b877551374204e70b930dd5d0920f7e1e75"
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
