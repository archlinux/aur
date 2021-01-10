# Maintainer: peippo <christoph+aur@christophfink.com>
pkgname=duplicity-dev
pkgver=0.8.18
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

sha512sums=('fd9dc472e4145725de343a3195ca8c898570ec492d46bc385d354c40b2c31e7c0da1f6e15e2a4a391d35926ae77e854992f4c973e55b072006c3f6489e27408f'
            'SKIP')
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
