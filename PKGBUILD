# Maintainer: Frederic Bezies < fredbezies at gmail dot com>
# Contributor: Jeffrey Clark (h0tw1r3) <dude@zaplabs.com>

pkgname=attract
pkgver=2.6.0
pkgrel=1
pkgdesc="A graphical front-end for command line emulators that hides the underlying operating system and is intended to be controlled with a joystick or gamepad."
arch=('i686' 'x86_64')
url="http://www.attractmode.org/"
license=('GPL3')
depends=('sfml' 'openal' 'ffmpeg' 'fontconfig' 'libxinerama' 'libarchive')
makedepends=('git')
provides=('attract')
conflicts=('attractmode-git')
source=("https://github.com/mickelson/${pkgname}/archive/v${pkgver}.tar.gz"
	"https://github.com/mickelson/${pkgname}/releases/download/v1.6.2/ATTRACT.MODE.intro.16-9.v6.1080p.mp4"
	"https://github.com/mickelson/${pkgname}/releases/download/v1.6.2/ATTRACT.MODE.intro.4-3.v6.1080p.mp4"
	attract.desktop
	attract.install)
install=attract.install

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
sha256sums=('f17f939428f79b5ef9725f3cdbc34b011d08f184613718a41112ce6699814468'
            '0a21286df3bd51edd24f6eb21a246f8a6576020d34ce3f5cfe93304dbbadc23b'
            '5750cf26864a86d7625f52223ac1a4050ff4475a016bb4f94fc506b7558dbaf9'
            'd5e94d30bf6329bef87f58aad31ae9ff4632550a8576c243e41f220262c36cf6'
            '4a0ad1e453b8fd9b14495d2f88da8ff9502dcb3902182f171e452ff67ae0f948')
