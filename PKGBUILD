# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname='xdwm'
pkgver='6.1p7'
pkgrel=1
pkgdesc='An extended dynamic window manager for X (dwm fork)'
url='http://github.com/aperezdc/xdwm'
license=('MIT')
source=("https://github.com/downloads/aperezdc/$pkgname/$pkgname-$pkgver.tar.gz")
arch=('i686' 'x86_64')
md5sums=('f7aeee78df89fb646fccd385f9cfca74')
depends=('libx11' 'libxinerama' 'xorg-xrdb')
optdepends=(
  'pulseaudio:        launch pulseaudio at session startup'
  'gnome-keyring:     launch GNOME keyring at session startup'
  'consolekit:        register sessions with ConsoleKit'
)

build () {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make PREFIX=/usr
	make PREFIX=/usr -C session
}

package () {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make PREFIX=/usr DESTDIR="${pkgdir}/" install
	make PREFIX=/usr DESTDIR="${pkgdir}/" -C session install
}
