# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
pkgname=vorta
pkgver=0.8.12
pkgrel=3
pkgdesc="A GUI for BorgBackup"
arch=('any')
url="https://github.com/borgbase/vorta"
license=('GPL')
depends=('borg' 'python-appdirs' 'python-pyqt5' 'python-peewee' 'python-dateutil' 'python-secretstorage' 'python-psutil' 'python-llfuse' 'python-setuptools')
makedepends=('qt5-tools'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel')
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://github.com/borgbase/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('697a1d6f6f93b1b2447c7f19cf250d24d72e2f784e62c54287d9ee39cac59f38')
          

build() {
  cd "$pkgname-$pkgver"
  make translations-to-qm
  python -m build --no-isolation --wheel --skip-dependency-check
}
package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="${pkgdir:?}" dist/*.whl

  install -Dm644 package/icon-symbolic.svg \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/com.borgbase.Vorta-symbolic.svg"
  install -Dm644 "src/$pkgname/assets/metadata/com.borgbase.Vorta.appdata.xml" -t \
    "$pkgdir/usr/share/metainfo"
  install -Dm644 "src/$pkgname/assets/metadata/com.borgbase.Vorta.desktop" -t \
    "$pkgdir/usr/share/applications"
}

# vim:set ts=2 sw=2 et:
