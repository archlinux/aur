# Maintainer: <getzze at gmail dot com>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname='python-asv-runner'
_pkgname='asv_runner'
pkgver=0.2.1
pkgrel=2
pkgdesc="Core Python benchmark code for ASV."
arch=('x86_64')
url="https://asv.readthedocs.io/projects/asv-runner"
license=('BSD-3')
depends=()
optdepends=()
makedepends=('python-build' 'python-installer' 'python-pdm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/airspeed-velocity/asv_runner/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('555eb3387f64e21cda4d82e0a67dd3e3c1618a4998815195200e2baecb21a73f')


prepare(){
  cd "${_pkgname}-${pkgver}"
  ## Compat with python>3.7
  sed -i 's/importlib_metadata/importlib.metadata/' asv_runner/benchmarks/__init__.py
}

build(){
  cd "${_pkgname}-${pkgver}"
  PDM_BUILD_SCM_VERSION=$pkgver python -m build --wheel --no-isolation
}

package(){
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

# vim:ts=2:sw=2:et:
