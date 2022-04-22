# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=system-monitoring-center
pkgver=1.12.0
_pkgver="$pkgver-deb_for_stores"
pkgrel=1
pkgdesc="System performance and usage monitoring tool"
arch=('any')
url="https://github.com/hakandundar34coding/system-monitoring-center"
license=('GPL3')
depends=('bash' 'dmidecode' 'gtk3' 'libwnck3' 'python-cairo'
         'python-gobject' 'systemd' 'util-linux')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
changelog="$pkgname.changelog"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$_pkgver.tar.gz")
sha256sums=('2a6df69e11228c9577f3d9dc0a19c16f083b21b1e037582e8b9b6b148ffe5e3d')

build() {
  cd "$pkgname-$_pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$_pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  mv "${pkgdir}${site_packages}"/usr/{bin,share} "$pkgdir/usr/"
  rm -rf "${pkgdir}${site_packages}/usr"
}
