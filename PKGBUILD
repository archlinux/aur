# Maintainer: piernov <piernov@piernov.org>
#
pkgname=python-hdf5plugin
_name=${pkgname#python-}
pkgver=7.1.0
pkgrel=1
pkgdesc="Set of compression filters for h5py"
arch=('any')
url="https://github.com/silx-kit/hdf5plugin"
license=('MIT')
depends=('python' 'python-h5py')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-py-cpuinfo2')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz"
        "allow-newer-cpuinfo.patch")
sha256sums=('dc4aa9576bf5770d773be9309a060ccf2f0ce2f0031f2b369f566d2662ec2fb3'
            '51f63d742e0ad6b3d1583bb8e7756c9a1249ed835f9cabd5421e5a0e4896b193')

prepare() {
  cd "${_name//-/_}-$pkgver"
  patch -p1 -i "${srcdir}/allow-newer-cpuinfo.patch"
}

build() {
  cd "${_name//-/_}-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name//-/_}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
