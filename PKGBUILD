# Maintainer: Jaro Zink <j dot zink at outlook dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=mnamer
pkgver=2.5.5
pkgrel=2
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
  'python-teletype'
  'python-typing_extensions')
makedepends=('python-build' 'python-setuptools-scm' 'python-wheel')
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
  "sessioncache.patch")
sha256sums=(
  '1054c65164aef1815e8bd7b305d68fd69d583249b7fda939f12515cdc264958e'
  '26b3cbbc09772974ff15795db9dd0a60260af1b25ab0c98597fd758c61ed2bc5')

prepare() {
  patch -d "${pkgname}-${pkgver}" -p1 -i ../sessioncache.patch
}

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
