# Maintainer: Henry-ZHR <henry-zhr@qq.com>
pkgname=python-imgcompare
pkgver=2.0.1
pkgrel=1
pkgdesc='Compares two images for equality or a difference percentage'
arch=('any')
url='https://github.com/datenhahn/imgcompare'
license=('MIT')
depends=('python'
         'python-pillow')
makedepends=('git'
             'python-build'
             'python-installer'
             'python-wheel')
_tag='959cc9864b0b62a4388d77289056ad58be70b099'
source=("${pkgname}::git+${url}.git#tag=${_tag}")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --tags
}

build() {
  cd "${pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

check() {
  cd "${pkgname}"
  python -m unittest discover -v
}
