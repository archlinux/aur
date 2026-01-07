# Maintainer: Jaro Zink <j dot zink at outlook dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=mnamer
pkgver=2.6.0
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
  'python-teletype'
  'python-typing_extensions')
makedepends=('python-build' 'python-setuptools-scm' 'python-wheel')
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
  "sessioncache.patch")
sha256sums=(
  'af30841941c89a0281481dfb034ba18f3ff9e5fd58a403d86473f26b5f2dc491'
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
