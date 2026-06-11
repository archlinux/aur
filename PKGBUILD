# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname="bzfs"
_name="bzfs"
pkgver=1.22.0
pkgrel=1
pkgdesc="ZFS dataset replication tool."
url='https://github.com/whoschek/bzfs'
license=("Apache-2.0")
arch=("any")
depends=(
  'python'
)
optdepends=(
  'zstd: compression'
  'pv: progress bars'
  'mbuffer: stream buffering'
  'python-tenacity: auxiliary test microbenchmark'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('3d2a050db9289f26aa9bfc548c65cce8362af942329af072e5c2d27e7570c2b2')

build(){
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package(){
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  # See https://github.com/whoschek/bzfs/issues/5, tests folder accidentally in site-packages
  rm -rf "${pkgdir}"/usr/lib/python*/site-packages/tests
  rm -f "${pkgdir}/usr/bin/bzfs-test"
}
