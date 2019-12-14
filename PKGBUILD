# Maintainer: Arin Lares <arinlares@gmail.com>

pkgname=rocketlauncher2-git
_pkgname=RocketLauncher2
__pkgname=rocketlauncher2
pkgver=0.1.0.2.r11.gbdb48cd
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Rocket Launcher 2.0 is a cross platform front end for all DOOM source ports."
url="https://github.com/Hypnotoad90/RocketLauncher2"
license=("GLP3")
depends=("qt5-base")
makedepends=('qt5-base' 'gendesk' 'binutils')
source=("git+https://github.com/Hypnotoad90/RocketLauncher2")
md5sums=('SKIP')


pkgver() {
  cd "$srcdir/${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/${_pkgname}"
	gendesk -f -n --pkgname "$__pkgname" --pkgdesc "$pkgdesc" --categories=Game --icon=/usr/share/icons/rocketlauncher2.ico
}

build() {
	cd "$srcdir/$_pkgname"
	qmake
	make
}

package() {
	cd "$srcdir/$_pkgname"
	rename RocketLauncher2 rocketlauncher2 RocketLauncher2
	install -Dm755 rocketlauncher2 ${pkgdir}/usr/bin/${__pkgname}
	install -Dm644 img/rocket.ico ${pkgdir}/usr/share/icons/rocketlauncher2.ico
	mkdir ${pkgdir}/usr/share/applications
	install -Dm644 ${__pkgname}.desktop ${pkgdir}/usr/share/applications/${__pkgname}.desktop
} 
