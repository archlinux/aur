# Maintainer: RedBees <https://github.com/RedBeesRGD>
# Contributor: Thorsten Toepper <atsutane at freethoughts dot de>
# Contributor: William Giokas <1007380@gmail.com>

# This PKGBUILD was prepared for pacman 4.1 by William. Thank you. :-)

pkgname=i3-gradients-git
pkgver=4.21.r4.g09670218+GRADIENTS
pkgrel=1
pkgdesc='i3 with highly customizable gradient titlebars, dithering effects, and more!'
arch=('i686' 'x86_64')
url='https://github.com/RedBeesRGD/i3-gradients'
license=('BSD')
provides=('i3-gradients')
conflicts=('i3-gradients' 'i3-wm' 'i3-gaps' 'i3-gaps-next-git')
groups=('i3' 'i3-vcs')
depends=('xcb-util-keysyms' 'xcb-util-wm' 'libev' 'yajl'
         'startup-notification' 'pango' 'perl' 'xcb-util-cursor' 'xcb-util-xrm'
         'libxkbcommon-x11')
makedepends=('git' 'bison' 'flex' 'asciidoc' 'xmlto' 'meson')
optdepends=('i3lock: For locking your screen.'
            'i3status: To display system information with a bar.')
options=('docs')
source=('git+https://github.com/RedBeesRGD/i3-gradients#branch=main')
sha1sums=('SKIP')

#pkgver() {
#  cd "$srcdir/i3-gradients"
#  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
#}


build() {
  cd "i3-gradients"
  arch-meson \
    -Ddocs=true \
    -Dmans=true \
  ../build
  meson compile -C ../build
}

package() {
  cd "i3-gradients"
  DESTDIR="${pkgdir}" meson install -C ../build

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE
}

# vim:set ts=2 sw=2 et:
