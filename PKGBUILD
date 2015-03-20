# Maintainer: Yardena Cohen <yardenack at gmail dot com>

pkgname=linode-api-python-git
gitname=linode-python
pkgver=174.a565abb
pkgrel=1
pkgdesc="Linode API bindings for Python 2.7"
arch=('any')
url="https://github.com/tjfontaine/linode-python"
license=('BSD')
makedepends=('git')
depends=('python2')
optdepends=('python-pycurl: For verification of SSL keys')
source=("git+https://github.com/tjfontaine/${gitname}.git")
sha512sums=('SKIP')

pkgver() {
	 cd "${srcdir}/${gitname}"
	 local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
	 printf "%s" "${ver//-/.}"
}

build() {
	 cd "${srcdir}/${gitname}"
	 python2 setup.py build
}

package() {
	 cd "${srcdir}/${gitname}"
	 python2 setup.py install --prefix=/usr --root="${pkgdir}" --skip-build
	 rm -r build/
}
