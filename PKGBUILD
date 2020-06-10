# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
pkgname=python-meshio
pkgver=4.0.13
pkgrel=2
pkgdesc='Input/output for many mesh formats'
url='https://github.com/nschloe/meshio'
arch=('x86_64')
license=('MIT')
depends=('python-numpy')
makedepends=('python-pep517')
optdepends=('python-netcdf4' 'python-h5py')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('006a010f9ee0a61efd63d61ea05cf2ff502dfaa61ae642e8eaf799bfeb64ec79')

build() {
  cd "meshio-$pkgver"
  python3 -m pep517.build --source .
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

