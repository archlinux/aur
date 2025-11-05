# Maintainer: Orestis Floros <orestisflo@gmail.com>
# Contributor: Jan-Erik Rediger <badboy at archlinux dot us>
# Contributor: Thorsten Toepper <atsutane at freethoughts dot de>
# Contributor: William Giokas <1007380@gmail.com>
# This PKGBUILD was prepared for pacman 4.1 by William. Thank you. :-)

pkgname=i3-git
pkgver=4.24.r23.g2711f427
pkgrel=1
pkgdesc='An improved dynamic tiling window manager'
arch=('i686' 'x86_64')
url='http://i3wm.org/'
license=('BSD')
provides=('i3-wm')
conflicts=('i3-wm' 'i3-gaps' 'i3-gaps-next-git')
groups=('i3' 'i3-vcs')
depends=('libev' 'libxkbcommon-x11' 'pango' 'startup-notification' 'ttf-font'
         'xcb-util-cursor' 'xcb-util-keysyms' 'xcb-util-wm' 'xcb-util-xrm'
         'yajl')
makedepends=('asciidoc' 'git' 'meson' 'xmlto')
optdepends=('i3lock: For locking your screen.'
            'i3status: To display system information with a bar.')
optdepends=('dmenu: for the default program launcher'
            'i3lock: for the default screen locker'
            'i3status: for the default status bar generator'
            'perl-anyevent-i3: for i3-save-tree'
            'perl-json-xs: for i3-save-tree'
            'perl: for i3-save-tree and i3-dmenu-desktop'
            'rofi: for a modern dmenu replacement'
            'xss-lock: for the default screen locker')
source=('git+https://github.com/i3/i3#branch=next')
sha1sums=('SKIP')
options=('docs')

pkgver() {
  cd "$srcdir/i3"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
  cd i3
  arch-meson -Dmans=true -Ddocs=true build
  meson compile -C build
}

package() {
  cd i3
  DESTDIR="${pkgdir}" meson install -C build

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE
}

# vim:set ts=2 sw=2 et:
