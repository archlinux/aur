# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
pkgname=vorta
pkgver=0.8.7
pkgrel=1
pkgdesc="A GUI for BorgBackup"
arch=('any')
url="https://github.com/borgbase/vorta"
license=('GPL')
depends=('borg' 'python-appdirs' 'python-pyqt5' 'python-peewee' 'python-paramiko' 'python-dateutil' 'python-secretstorage' 'python-psutil' 'python-llfuse' 'python-setuptools')
makedepends=('qt5-tools' 'python-pip')
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://github.com/borgbase/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('0957d8ccee6c8d7c6cd0a61a18118e29ff460866adba6bb840a22668261d6aae')
          

build() {

  cd "$pkgname-$pkgver"
  make translations-to-qm
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 package/icon-symbolic.svg \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/com.borgbase.Vorta-symbolic.svg"
  install -Dm644 "src/$pkgname/assets/metadata/com.borgbase.Vorta.appdata.xml" -t \
    "$pkgdir/usr/share/metainfo"
  install -Dm644 "src/$pkgname/assets/metadata/com.borgbase.Vorta.desktop" -t \
    "$pkgdir/usr/share/applications"
}

# vim:set ts=2 sw=2 et:
