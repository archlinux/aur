# Maintainer: Thorsten Töpper <atsutane-aur@freethoughts.de>
# Co-Maintainer: Ingo Bürk <ingo.buerk@airblader.de>
# Contributor: William Giokas <1007380@gmail.com>

pkgname=i3status-git
pkgver=2.14.r8.g28399bf
pkgrel=1
pkgdesc='Generates status bar to use with i3bar'
arch=('x86_64')
url='http://i3wm.org/i3status/'
license=('BSD')
groups=('i3-vcs')
depends=('confuse' 'alsa-lib' 'yajl' 'libpulse' 'libnl')
makedepends=('asciidoc' 'xmlto' 'meson')
options=('docs')
conflicts=('i3status')
provides=('i3status')
source=(git+https://github.com/i3/i3status)
sha1sums=('SKIP')

_gitname='i3status'

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "i3status"

  arch-meson --prefix=/usr -Dmans=true ../build
  meson compile -C ../build
}

package() {
  cd "i3status"

  meson install -C ../build --destdir "$pkgdir"
  install -Dm644 -t "$pkgdir"/usr/share/licenses/"$pkgname" LICENSE
}

# vim:set ts=2 sw=2 et:
