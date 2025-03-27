# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname="bzfs"
_name="bzfs"
pkgver=1.11.0
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
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('bc6e1864e67958bd07c67bfd64c975cb88beef7a50bc8bcc70922b6657b351e2')

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
