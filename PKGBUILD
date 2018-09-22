# Maintainer: Tim Savannah <kata198@gmail.com>

pkgname=('python-cmp_version' 'cmp_version')
pkgver=3.0.0
pkgrel=2
pkgdesc="A script and python module to compare version numbers. Use this to compare the version strings of packages, modules, really anything."
arch=('any')
license=('LGPLv3')
url="http://github.com/kata198/cmp_version"
makedepends=('python-setuptools' 'python')
depends=('python-setuptools' 'python')

source=("https://github.com/kata198/cmp_version/archive/${pkgver}.tar.gz")
sha512sums=('20a6e4d8885793ab742d441f45dd0516cd023232e4da93904169fcba67d106ae9fb3e00c11703fe82f9ccc6a80860b1a4a2090cd4dc0f36c708e7c5fdb1dd11a')

build() {
  cd "$srcdir"/cmp_version-$pkgver
  python setup.py build

}

package_python-cmp_version() {
  cd cmp_version-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  # Remove tool from lib package
  rm -Rf "${pkgdir}/usr/bin"
}




package_cmp_version() {
  depends=('python-cmp_version')
  cd cmp_version-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  # Remove lib from tools package
  rm -Rf "${pkgdir}/usr/lib"
}
