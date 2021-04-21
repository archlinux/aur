# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
pkgname=python-meshio
pkgver=4.3.13
pkgrel=1
pkgdesc='Input/output for many mesh formats'
url='https://github.com/nschloe/meshio'
arch=('x86_64')
license=('MIT')
depends=('python-numpy')
makedepends=('python-build' 'python-pip')
optdepends=('python-netcdf4' 'python-h5py')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('73a345df10538283b4f00d544e1920a62f1cbcc6a225cb1c0a5d27c0838851a4')

build() {
  cd "meshio-$pkgver"
  python3 -m build .
}

package() {
  cd "meshio-$pkgver/dist"
  tar zxf "meshio-$pkgver.tar.gz"

  cd "meshio-$pkgver"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  _site=$(/usr/bin/python3 -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')
  mkdir -p "$pkgdir/$_site/"
  cp -a meshio "$pkgdir/$_site/"
}

