# Maintainer: Alex Potapenko <opotapenko@gmail.com>

pkgname=zapzap
_pkgname=com.rtosta.zapzap
pkgver=6.4.0
_tag=${pkgver//\~/-}
pkgrel=1
pkgdesc='WhatsApp desktop application written in Pyqt6 + PyQt6-WebEngine'
arch=(x86_64)
url="https://github.com/rafatosta/$pkgname"
license=(GPL3)
depends=('python-pyqt6' 'python-pyqt6-webengine' 'dbus-python' 'qt6-wayland' 'python-jaraco.text' 'python-inflect' 'python-pydantic>=1.9.1' 'python-typing_extensions>=4.6.1')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools>=40.8.0' 'python-wheel' 'desktop-file-utils')
optdepends=('hunspell: spell check')
source=(git+$url#tag=$_tag)
b2sums=('1078bebab349b7c2399aaad9770ed9e8ef2bcb0fa7050baad46fa8f20ce8929e0b75e76c24a0f16f9fda76130212942cdc42beaefa59e484678692beb187bd29')

build() {
  cd $pkgname
  rm -rf dist/
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 share/icons/$_pkgname.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg
  install -Dm664 share/applications/$_pkgname.desktop "$pkgdir"/usr/share/applications/$_pkgname.desktop
  install -Dm664 share/metainfo/$_pkgname.appdata.xml "$pkgdir"/usr/share/metainfo/$_pkgname.appdata.xml
}
