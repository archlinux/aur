# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
pkgname=python-meshio
pkgver=5.0.0
pkgrel=1
pkgdesc='Input/output for many mesh formats'
url='https://github.com/nschloe/meshio'
arch=('x86_64')
license=('MIT')
depends=('python-numpy')
makedepends=('python-build' 'python-pip')
optdepends=('python-netcdf4' 'python-h5py')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('68c221872226d504296f94294b61f278cc838dd42dfcb08708398cf30790c38b')

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

