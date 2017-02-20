# Maintainer: Micah Elliott <mde at micahelliott dot com>
pkgname=flickpapr
# pkgver=r24.86adcc7
pkgver=r29.768edc4
pkgrel=1
pkgdesc='randomly choose an “interesting” flickr photo for desktop wallpaper'
arch=('any')
url='https://github.com/MicahElliott/flickpapr'
license=('GPL')
groups=()
depends=('zsh' 'ruby' 'ruby-nokogiri' 'libnotify' 'feh' 'imagemagick' 'daemonize' 'dunst')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/MicahElliott/flickpapr.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

# The examples below are not absolute and need to be adapted to each repo. The
# primary goal is to generate version numbers that will increase according to
# pacman's version comparisons with later commits to the repo. The format
# VERSION='VER_NUM.rREV_NUM.HASH', or a relevant subset in case VER_NUM or HASH
# are not available, is recommended.

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	: cd "$srcdir/${pkgname%-git}"
}

build() {
	: cd "$srcdir/${pkgname%-git}"
}

check() {
	: cd "$srcdir/${pkgname%-git}"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm755 bin/flickpapr $pkgdir/usr/bin/flickpapr
  install -Dm755 bin/flickloop $pkgdir/usr/bin/flickloop
  install -Dm755 bin/flickd    $pkgdir/usr/bin/flickd
  install -Dm755 bin/flickill  $pkgdir/usr/bin/flickill
  install -Dm755 share/flickpapr/flickr-icon-64.png    $pkgdir/usr/share/flickpapr/flickr-icon-64.png
  install -d -Dm755 $pkgdir/usr/share/flickpapr/
  install -Dm755 share/flickpapr/flickr-icon-bw-64.png $pkgdir/usr/share/flickpapr/flickr-icon-bw-64.png
  install -Dm644 flickpapr.service $pkgdir/usr/lib/systemd/user/flickpapr.service
  echo "You can start/enable the daemon by running:"
  echo '  systemctl --user start|enable flickpaper'
  # install systemd user unit
}
