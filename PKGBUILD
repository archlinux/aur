# Maintainer: Finn Hering <finn@hering.sh>
# Based on i3-gaps-next-git PKGBUILD 

pkgname=i3-gaps-rounded-git
pkgver=4.20.1.r84.g8e5eed5b
pkgrel=1
pkgdesc='A fork of i3wm tiling window manager with more features, including gaps and rounded corners'
arch=('i686' 'x86_64')
url='https://github.com/FinnHering/i3'
license=('BSD')
provides=('i3-wm')
conflicts=('i3-wm' 'i3bar' 'i3bar-git' 'i3-git' 'i3-gaps-git' 'i3-gaps')
depends=('xcb-util-keysyms' 'xcb-util-wm' 'libev' 'yajl'
         'startup-notification' 'pango' 'perl' 'xcb-util-cursor' 'xcb-util-xrm'
         'libxkbcommon-x11' 'pcre2')
makedepends=('git' 'bison' 'flex' 'asciidoc' 'xmlto' 'meson')
optdepends=('i3lock: For locking your screen.'
            'i3status: To display system information with a bar.')
options=('docs')
source=('i3-gaps-round::git+https://github.com/FinnHering/i3#branch=main')
sha1sums=('SKIP')

_gitname='i3-gaps-round'

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_gitname"
  arch-meson \
    -Ddocs=true \
    -Dmans=true \
  ../build
  meson compile -C ../build
}

package() {
  cd "$_gitname"
  DESTDIR="$pkgdir" meson install -C ../build
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE

}

# vim:set ts=2 sw=2 et:

