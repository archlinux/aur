# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname="bzfs"
_name="bzfs"
pkgver=1.25.0
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
  'python-uv-build'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('e7d2ce2c84b22869910aa19d063d2cdbefc54fda5d3e5650b3fe420798bcc082')

build(){
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package(){
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  # See https://github.com/whoschek/bzfs/issues/5, tests folder accidentally in site-packages
  rm -rf "${pkgdir}"/usr/lib/python*/site-packages/tests
  rm -f "${pkgdir}/usr/bin/bzfs-test"
}
