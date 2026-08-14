# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname="bzfs"
_name="bzfs"
pkgver=1.24.0
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
sha256sums=('d584ba293b615b74db327763488a5eaf1e1548d4537c9fa8e2fb942488707d1c')

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
