# Maintainer: GI_Jack <GI_Jack@hackermail.com>
pkgname=karma
pkgver=1.2.0
pkgrel=2
pkgdesc="Search of Emails and Passwords on Pwndb"
arch=('any')
url="https://github.com/decoxviii/karma"
license=('MIT')
depends=('python' 'python-docopt' 'python-requests' 'python-pysocks' 'python-texttable' 'tor')
conflicts=("karma-git")
install=
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/decoxviii/${pkgname}/archive/${pkgver}.tar.gz"
	"path_change.patch")
sha256sums=('da3eb8bfdc3c192053f312d99f84e1861b0120e5b01cdbbbc874845448bc77e7'
            'cf277a63110e513a8aec9d921266c8b22e5e58b93995bf4aa6f1c8684a15166b')

prepare() {
  cd "${srcdir}"
  # Adjust path declaration
  patch -i path_change.patch "${pkgname}-${pkgver}/bin/karma"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}

