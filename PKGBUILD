# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
pkgname=python-meshio
pkgver=5.1.2
pkgrel=1
pkgdesc='Input/output for many mesh formats'
url='https://github.com/nschloe/meshio'
arch=('x86_64')
license=('MIT')
depends=('python-numpy' 'python-npx')
makedepends=('python-build' 'python-pip')
optdepends=('python-netcdf4' 'python-h5py')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5ba0d7ca22713c1d7c6a0cbf549ecf6a18be54d5824f622ee4d2bdbe22b13d0d')

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
  cp -a "src/meshio" "$pkgdir/$_site"
  cp -a "src/meshio.egg-info" "$pkgdir/$_site"
}

