# Maintainer: Jaro Zink <j dot zink at outlook dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Jessy Williams <jessy at jessywilliams dot com>

pkgname=mnamer
pkgver=2.7.2
pkgrel=1
pkgdesc='A media organization tool'
arch=('any')
url='https://github.com/jkwill87/mnamer'
license=('MIT')
depends=(
  'python'
  'python-appdirs'
  'python-babelfish'
  'python-guessit'
  'python-requests'
  'python-requests-cache'
  'python-teletype')
makedepends=('python-build' 'python-setuptools-scm' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('dd35f6ca1f6424663235e082855993cffabea781b31f897846e798f98ef6b693')

build() {
  cd "${pkgname}-${pkgver}"
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
