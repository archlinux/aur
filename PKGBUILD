pkgname=aniwrapper-git
_pkgname=aniwrapper
pkgver=r348.fa108d8
pkgrel=1
pkgdesc="A rofi wrapper around a modified ani-cli: a cli to browse and watch anime"
arch=('any')
url="https://github.com/ksyasuda/aniwrapper"
license=('GPL3')
depends=('axel' 'curl' 'ffmpeg' 'grep' 'mpv' 'openssl' 'rofi' 'sed' 'sqlite3')
makedepends=('git')
optdepends=('vlc: An alternative video player')
source=('aniwrapper::git+https://github.com/ksyasuda/aniwrapper.git')
md5sums=('SKIP')
provides=('aniwrapper' 'ani-cli')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${_pkgname%-VCS}"
	chmod +x setup.sh && ./setup.sh
	install -Dm755 ./ani-cli "$pkgdir/usr/bin/ani-cli"
	install -Dm755 ./aniwrapper "$pkgdir/usr/bin/aniwrapper"
	install -Dm644 ./docs/man/aniwrapper.1 "$pkgdir/usr/local/man/man1/aniwrapper.1"
}
