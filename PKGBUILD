# Maintainer: Yardena Cohen <yardenack at gmail dot com>
# Maintainer: Alexander Epaneshnikov <aarnaarn2@gmail.com>

pkgname=s3cmd-git
pkgver=2.1.0.r88.g27d8fb0
pkgrel=1
pkgdesc="A command line client for Amazon S3 (development version)"
arch=('any')
url="https://github.com/s3tools/${pkgname%-git}"
license=('GPL2')
depends=('python' 'python-dateutil')
makedepends=('git' 'python-setuptools')
optdepends=('gnupg: encrypted file storage'
            'python-magic: determine mimetype based on contents')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=(${pkgname%-git}::"git+${url}.git")
sha512sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	# cutting off 'v' prefix that presents in the git tag
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/_/-/g;s/-/./g'
}

build() {
	cd "${pkgname%-git}"
	python setup.py build
}

package() {
	cd "${pkgname%-git}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
