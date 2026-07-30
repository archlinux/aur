# Maintainer: Alex Potapenko <opotapenko@gmail.com>

pkgname=zapzap
_pkgname=com.rtosta.zapzap
pkgver=7.2
_tag=${pkgver//\~/-}
pkgrel=1
pkgdesc='WhatsApp desktop application written in Pyqt6 + PyQt6-WebEngine'
arch=('x86_64')
url="https://github.com/rafatosta/$pkgname"
license=('GPL3')
depends=('python-pyqt6' 'python-pyqt6-webengine' 'dbus-python' 'qt6-wayland' 'python-jaraco.text' 'python-inflect' 'python-pydantic>=1.9.1' 'python-typing_extensions>=4.6.1')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools>=40.8.0' 'python-wheel' 'desktop-file-utils')
optdepends=('hunspell: spell check')
source=("git+$url#tag=$_tag"
        'com.rtosta.zapzap.nogpu.desktop')
b2sums=('f09aac9710ff952d03eb644feee4c7c4c068e596964af018bb3dc542165455e92e00f47efb42747f68342a909ca8264a1c2853b08013693fd0312f1d55ab6685'
        '35b0bad1219847bfc5a346e4d5006888d25dbeeef6c87c0c644d4b5db411a4137c3473d173409122802f5986ccbbd342e7180c487bf065f772c4773c4da7efea')

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
  install -Dm664 "$srcdir"/com.rtosta.zapzap.nogpu.desktop "$pkgdir"/usr/share/applications/
  install -Dm664 share/metainfo/$_pkgname.appdata.xml "$pkgdir"/usr/share/metainfo/$_pkgname.appdata.xml
}
