# Maintainer: Jeffrey Clark (h0tw1r3) <dude@zaplabs.com>

pkgname=attract
pkgver=2.0.0
pkgrel=2
pkgdesc="A graphical front-end for command line emulators that hides the underlying operating system and is intended to be controlled with a joystick or gamepad."
arch=('i686' 'x86_64')
url="http://www.attractmode.org/"
license=('GPL3')
depends=('sfml' 'openal' 'ffmpeg' 'fontconfig' 'libxinerama' 'libarchive')
makedepends=('git')
provides=('attract')
conflicts=('attractmode-git')
source=("https://github.com/mickelson/${pkgname}/archive/v${pkgver}.tar.gz"
	"0001-fix-build-when-TR1-enabled.patch"
	"https://github.com/mickelson/${pkgname}/releases/download/v1.6.2/ATTRACT.MODE.intro.16-9.v6.1080p.mp4"
	"https://github.com/mickelson/${pkgname}/releases/download/v1.6.2/ATTRACT.MODE.intro.4-3.v6.1080p.mp4"
	attract.desktop
	attract.install)
sha1sums=('f658c5eb69ca405e2b0764e9365d1c5a5ff1e57a'
	'cc6294a66c3e88861a7bb17eaba1edaabc095317'
	'37885c5f2e6194e689c36eb88c43bd5bb23363d0'
	'445bb161b9c06749347974b6c19c846d86b00ceb'
	'cf599edbff2962b5ff0a77560a95d80cec828264'
	'284afdf55086f2a626d5ab617240ff74cea30f53')
install=attract.install

prepare() {
    patch -N -p1 -d "${pkgname}-${pkgver}" -i ../0001-fix-build-when-TR1-enabled.patch
}

build() {
	cd "${pkgname}-${pkgver}"
	VERSION="$pkgver" make prefix=/usr
}

package() {
	cd "${pkgname}-${pkgver}"
	make prefix="${pkgdir}/usr" install
	install -Dm644 License.txt ${pkgdir}/usr/share/licenses/${pkgdir}/License.txt
	install -Dm644 ../ATTRACT.MODE.intro.16-9.v6.1080p.mp4 ${pkgdir}/usr/share/attract/intro/intro.mp4
	install -Dm644 ../ATTRACT.MODE.intro.4-3.v6.1080p.mp4 ${pkgdir}/usr/share/attract/intro/intro_4x3.mp4
	install -Dm644 util/icon.png ${pkgdir}/usr/share/pixmaps/attract.png
	install -Dm644 ${srcdir}/attract.desktop ${pkgdir}/usr/share/applications/attract.desktop
}
