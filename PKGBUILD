# Maintainer: Euro20179 <Euro20179@protonmail.com>

pkgname=ytfzf-git
pkgver=r1439.2331f87
pkgrel=1
pkgdesc="A posix script to find and watch youtube videos from the terminal. (Without API)"
arch=('any')
url="https://github.com/pystardust/ytfzf"
license=('GPL')
depends=('jq' 'curl' 'grep' 'sed')
makedepends=('git') 
optdepends=(
	'dmenu: use dmenu for search prompts and results'
	'rofi:  use rofi for search prompts and results'
	'fzf:   use fzf for results'
	'mpv:   use mpv for video player'
	'ueberzug: thumbnails image preview'
	'yt-dlp: for downloading'
)
provides=('ytfzf')
conflicts=("ytfzf")
install=
source=('ytfzf::git+https://github.com/pystardust/ytfzf.git#branch=development')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	sed -i 's_\${YTFZF\_SYSTEM\_ADDON\_DIR:=/usr/local/share/ytfzf/addons}_\${YTFZF\_SYSTEM\_ADDON\_DIR:=/usr/share/ytfzf/addons}_' ${pkgname%-git}
	make PREFIX="${pkgdir}/usr" install doc addons
}
