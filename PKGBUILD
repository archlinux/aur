# Maintainer: realroot <scorpion2185@protonmail.com>

_pkgname=wotimer
pkgname=${_pkgname}-git
pkgver=0.2.0.r61.gcab3985
pkgrel=1
pkgdesc="Qml (from Qt) timer with WorkOuts in mind."
arch=('x86_64' 'aarch64')
url="https://codeberg.org/realroot/wotimer"
license=('AGPL3')
makedepends=('qt6-base' 'make' 'git' 'gcc')
depends=('qt6-base' 'qt6-multimedia' 'qt6-declarative' 'qt6-webengine')
conflicts=("${_pkgname}")
#optdepends=('')
source=("${pkgname}::git+https://codeberg.org/realroot/wotimer.git")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --always | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	qmake6
	make 
}

package() {
	cd "$pkgname"
	install -Dm644 src/com.root.WoTimer.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/com.root.WoTimer.svg
	install -Dm644 src/com.root.WoTimer.desktop "$pkgdir"/usr/share/applications/com.root.WoTimer.desktop
	install -Dm755 wotimer "$pkgdir"/usr/bin/wotimer
}
