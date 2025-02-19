# Maintainer: Aleksandr Beliaev <trap000d@gmail.com>

pkgname=python-wsgidav-seafile
pkgver=12.0.9
pkgrel=1
pkgdesc="Seafile webdav server"
arch=('any')
url="https://github.com/haiwen/seafdav"
license=('MIT')

depends=('python'
         'python-json5'
         'python-seafobj'
         'python-defusedxml'
         'python-jinja'
         'python-sqlalchemy'
         'python-yaml')

makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'libyaml')

conflicts=('python-wsgidav')
source=("${url}/archive/v${pkgver}-server.tar.gz")
sha256sums=('f368fd5e843d3691dbb67fac43bb0b81fe3e49b336dfd2fc0696f5c448cf8f02')

prepare() {
  cd "$srcdir/seafdav-$pkgver-server"
  # exclude  deprecated and broken [data_files] section
  sed -i '/options.data_files/ { N; d; }' setup.cfg
}

build() {
  cd "$srcdir/seafdav-$pkgver-server"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/seafdav-$pkgver-server"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
