# Maintainer: Aleksandr Beliaev <trap000d@gmail.com>

pkgname=python-wsgidav-seafile
pkgver=13.0.29
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
sha256sums=('e9a30784cf7f500483866388516923e9d59f82626f9076c6f12adaeaff5a1ecd')

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
