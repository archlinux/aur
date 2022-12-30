# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=zapzap-git
_pkgname=com.rtosta.zapzap
pkgver=4.4.3.r2.gd36af54
pkgrel=1
pkgdesc="WhatsApp desktop application written in Pyqt6 + PyQt6-WebEngine"
arch=('x86_64')
url="https://github.com/rafatosta/${pkgname%-git}" 
license=('GPL3')
depends=('python-pyqt6' 'python-pyqt6-webengine' 'dbus-python' 'qt6-wayland')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=(
	'hunspell: spell check'
	)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^foo-//;s/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd ${pkgname%-git}
  python -m build --wheel --no-isolation
}

package() {
  cd ${pkgname%-git}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 share/icons/$_pkgname.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg
  install -Dm664 share/applications/$_pkgname.desktop "$pkgdir"/usr/share/applications/$_pkgname.desktop
  install -Dm664 share/metainfo/$_pkgname.appdata.xml "$pkgdir"/share/metainfo/$_pkgname.appdata.xml
}
