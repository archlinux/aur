# Maintainer: Aleksandr Beliaev <trap000d@gmail.com>

pkgname=python-wsgidav-seafile
pkgver=13.0.24
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
sha256sums=('5a05a786d49993ccef4b47a4f2c85af08142aa46c44467911eba9e852c5009bb')

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
