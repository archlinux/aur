# Maintainer: apetresc <apetresc at gmail dot com>
# Contributor: realitygaps <realitygaps at yahoo dot com>

pkgname=s4cmd-python3-git
pkgver=66.f5f5ff0
pkgrel=1
pkgdesc="Super S3 command line tool (git) for Python 3"
arch=('any')
url="https://github.com/bloomreach/${pkgbase}"
license=('GPL')
depends=('python' 'python-dateutil' 'python-boto3')
makedepends=(git python-setuptools)
optdepends=('gnupg: encrypted file storage')
provides=('s4cmd')
conflicts=('s4cmd')
source=("git+${url}.git" "setup.py.patch")
md5sums=('SKIP'
         'ed8297a6a6b3c727e435ad9385eed02a')

prepare() {
  patch -uN "${srcdir}/${pkgbase}/setup.py" "${srcdir}/setup.py.patch"
}

pkgver() {
	 cd "${srcdir}/${pkgbase}"
	 local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
	 printf "%s" "${ver//-/.}"
}

package() {
  cd "${srcdir}/${pkgbase}"
  python setup.py install --root="$pkgdir"
}
