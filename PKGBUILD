# Maintainer: Aleksandr Beliaev <trap000d@gmail.com>

pkgname=python-wsgidav-seafile
pkgver=12.0.14
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
sha256sums=('00606ce7f20c391758b9d734d731e31f46e8f74eb0a3fb7de80b9859bc40e85e')

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
