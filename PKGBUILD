# Maintainer: Euro20179 <Euro20179@protonmail.com>

pkgname=ytfzf-git
pkgver=r1272.2146e47
pkgrel=1
pkgdesc="A posix script to find and watch youtube videos from the terminal. (Without API)"
arch=('any')
url="https://github.com/pystardust/ytfzf"
license=('GPL')
depends=('jq' 'mpv')
makedepends=('git') 
optdepends=(
	'dmenu: use dmenu for search prompts and results'
	'rofi:  use rofi for search prompts and results'
	'fzf:   use fzf for results'
	'ueberzug: thumbnails image preview'
	'yt-dlp: for downloading'
)
provides=('ytfzf')
conflicts=("ytfzf")
install=
source=('ytfzf::git+https://github.com/pystardust/ytfzf.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"

	install -Dm755 ytfzf "${pkgdir}/usr/bin/ytfzf"
	install -Dm644 LICENSE "${pkgdir}/usr/share/doc/ytfzf/LICENSE"
	cd docs
	install -dm0755 "${pkgdir}/usr/share/doc/ytfzf"
	install -Dm644 man/ytfzf.1 "${pkgdir}/usr/share/man/man1/ytfzf.1.gz"
	install -Dm644 man/ytfzf.5 "${pkgdir}/usr/share/man/man5/ytfzf.5.gz"
	install -Dm644 conf.sh "${pkgdir}/usr/share/doc/ytfzf"
}
