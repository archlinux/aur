# Maintainer: OmeGa <omega [U+0040] mailoo [.] org>
# Contributor: Suhaimi Ghazali <serdotlinecho@gmail.com>

pkgname=i3status-mpd-git
pkgver=r401.0e4c207
pkgrel=1
pkgdesc="Generates a status bar to use with i3bar, dzen2 or xmobar (with mpd support)."
arch=('i686' 'x86_64')
url="https://github.com/Gravemind/i3status"
license=('BSD')
depends=('alsa-lib' 'confuse' 'libmpdclient' 'wireless_tools' 'yajl')
makedepends=('asciidoc' 'git')
provides=('i3status')
conflicts=('i3status' 'i3status-git')
backup=('etc/i3status.conf')
source=("$pkgname"::'git://github.com/Gravemind/i3status.git')
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  sed -i 's/git describe --tags --abbrev=0/git rev-list --count HEAD/' Makefile

  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
