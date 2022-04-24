# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=system-monitoring-center
pkgver=1.12.1
pkgrel=1
pkgdesc="System performance and usage monitoring tool"
arch=('any')
url="https://github.com/hakandundar34coding/system-monitoring-center"
license=('GPL3')
depends=('bash' 'dmidecode' 'gtk3' 'iproute2' 'python-cairo' 'python-gobject'
         'systemd' 'util-linux')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
changelog="$pkgname.changelog"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ddca53b860869b5d6c8a07280fb66cf027366ae69372035312b5c2490211e667')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir/usr/share/$pkgname"
  mv "${pkgdir}${site_packages}"/systemmonitoringcenter/{applications,icons} \
    "$pkgdir/usr/share/"
  mv "${pkgdir}${site_packages}"/systemmonitoringcenter/{database,locale,src,ui} \
    "$pkgdir/usr/share/$pkgname/"
}
