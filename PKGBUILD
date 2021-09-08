# Maintainer: Georg Pichler <georg.pichler@gmail.com>

pkgname=pystatsd-git
pkgver=v3.3.r13.gf3f304b
pkgrel=1
pkgdesc="A Python client for statsd"
arch=('any')
url="https://pypi.python.org/pypi/statsd"
license=('custom')
makedepends=('git' 'python-setuptools')
depends=('python' 'python-six')
source=("${pkgname}::git+https://github.com/jsocol/pystatsd.git")
options=(!emptydirs)
md5sums=(SKIP)
provides=(pystatsd)

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${pkgname}"
  python3 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
