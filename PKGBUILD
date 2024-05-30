# Contributor: Stephen Gregoratto <dev@sgregoratto.me>

_pkgname=sfeed
pkgname=sfeed-git
pkgver=2.0.r0.g1f76c85
pkgrel=1
pkgdesc='RSS and Atom parser'
url='https://codemadness.org/sfeed.html'
license=('ISC')
provides=('sfeed')
conflicts=('sfeed')
replaces=('sfeed-curses-git')
arch=('i686' 'pentium4' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
depends=('sh' 'ncurses')
optdepends=('curl: sfeed_update script'
    'xclip: used by sfeed_curses for yanking the URL or enclosure'
    'xdg-utils: for xdg-open, used by sfeed_curses as a plumber by default'
    'awk: used by the sfeed_content and sfeed_markread script'
    'lynx: used by the sfeed_content script to convert HTML content'
)
makedepends=('git')
source=("$_pkgname::git://git.codemadness.org/sfeed")
sha256sums=('SKIP')

pkgver() {
  git -C "$_pkgname" describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  # To change the theme for sfeed_curses you can set SFEED_THEME. See the themes directory for the theme names.
  make SFEED_THEME="mono" -C "$_pkgname"
}

package() {
  make DESTDIR="$pkgdir" PREFIX='/usr' MANPREFIX='/usr/share/man' -C "$_pkgname" install
  install -Dvm644 "$_pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
