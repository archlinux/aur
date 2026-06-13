# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: devome <evinedeng@hotmail.com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Andrew Steinke <rkcf@rkcf.me>

_name="arabic-reshaper"
pkgname="python-${_name}"
pkgver=3.0.1
pkgrel=2
pkgdesc="Reconstruct Arabic sentences to be used in applications that do not support Arabic"
arch=('any')
url="https://github.com/mpcabd/${pkgname}"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-hatchling')
checkdepends=('python-pytest' 'python-pytest-cov')
optdepends=('python-fonttools>=4: TTF support')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz")
sha256sums=('eb1b9df3b5aaf3e8c1a454aad9f7754a062c2f2d134d972209b801db933caa7c')

latestver() {
  curl -fsSL "https://pypi.org/pypi/${_name}/json" |
    python -c "import sys, json; print(json.load(sys.stdin)['info']['version'])"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  pytest
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
