# Maintainer: Thorsten Toepper <atsutane at freethoughts dot de>
# Contributor: Jan-Erik Rediger <badboy at archlinux dot us>
# Contributor: William Giokas <1007380@gmail.com>

# This PKGBUILD was prepared for pacman 4.1 by William. Thank you. :-)

pkgname=i3-git
pkgver=4.10.2.r223.gb30d87e
pkgrel=1
pkgdesc='An improved dynamic tiling window manager'
arch=('i686' 'x86_64')
url='http://i3wm.org/'
license=('BSD')
provides=('i3-wm')
conflicts=('i3-wm' 'i3bar' 'i3bar-git')
groups=('i3-vcs')
depends=('xcb-util-keysyms' 'xcb-util-wm' 'libev' 'yajl'
         'startup-notification' 'pango' 'perl' 'xcb-util-cursor-git'
         'libxkbcommon-x11')
makedepends=('git' 'asciidoc' 'docbook-xsl' 'pkgconfig')
optdepends=('rxvt-unicode: The terminal emulator used in the default config.'
            'dmenu: As menu.'
            'i3lock: For locking your screen.'
            'i3status: To display system information with a bar.'
            'perl-json-xs: For i3-save-tree'
            'perl-anyevent-i3: For i3-save-tree')
options=('docs' '!strip' 'debug')
source=('git://github.com/i3/i3#branch=next')
sha1sums=('SKIP')

_gitname='i3'

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_gitname"
  make
  make -C man
}

package() {
  cd "$_gitname"

  make DESTDIR="$pkgdir/" install

  install -d "${pkgdir}/usr/share/man/man1/"
  install -m644 man/*.1 "${pkgdir}/usr/share/man/man1/"

  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  make clean
}

# vim:set ts=2 sw=2 et:

