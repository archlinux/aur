pkgname=('cmsis-svd-git')
pkgver=python.0.5.r21.gd2b2a41
pkgrel=1
pkgdesc='Aggegration of ARM Cortex-M CMSIS SVDs and related tools'
arch=('any')
url='https://github.com/cmsis-svd/cmsis-svd'
license=('custom')
depends=('python')
makedepends=('git' 'python-setuptools')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}" "python-${pkgname}")
source=("${pkgname%-*}::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname%-*}/python"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname%-*}/python"
  python -m installer --destdir="${pkgdir}" dist/*.whl
#  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
#  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
#  install -Dm 644 example*.py -t "${pkgdir}/usr/share/doc/${pkgname}/examples"
}
