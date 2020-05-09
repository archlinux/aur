# Maintainer: Paul Davis <paul@dangersalad.com>
pkgname=discord-overlay-git
pkgver=r49.0a2fa2f
pkgrel=2
pkgdesc="QT5 Overlay for discord"
arch=('x86_64')
url="https://github.com/trigg/DiscordOverlayLinux"
license=('GPL3')
depends=('qt5-webengine' 'python-pyqtwebengine' 'python-pyqt5' 'python-pyxdg')
makedepends=('git')
optdepends=('picom: transparency support')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('discord-overlay::git+https://github.com/trigg/DiscordOverlayLinux')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    
    # maintaining this comment for when/if there is a tag added to the repo
	# printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}


package() {
	install -m 0755 -D -T "$srcdir/${pkgname%-git}/discord-overlay" "$pkgdir/usr/bin/discord-overlay"
	install -m 0644 -D -T "$srcdir/${pkgname%-git}/discord-overlay.desktop" "$pkgdir/usr/share/applications/discord-overlay.desktop"
	install -m 0644 -D -T "$srcdir/${pkgname%-git}/README.md" "$pkgdir/usr/share/doc/discord-overlay/README.md"
}
