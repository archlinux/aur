# Maintainer: Ingo Bürk <admin at airblader dot de>

pkgname=i3-gaps-git
pkgver=4.12
pkgrel=1
pkgdesc='A fork of i3wm tiling window manager with more features, including gaps'
arch=('i686' 'x86_64')
url='https://github.com/Airblader/i3/tree/gaps'
license=('BSD')
provides=('i3-wm')
conflicts=('i3-wm' 'i3bar' 'i3bar-git' 'i3-git' 'i3-gaps-next-git' 'i3-gaps')
groups=('i3-vcs')
depends=('xcb-util-keysyms' 'xcb-util-wm' 'libev' 'yajl'
         'startup-notification' 'pango' 'perl' 'xcb-util-cursor'
         'libxkbcommon-x11')
makedepends=('git' 'asciidoc' 'docbook-xsl' 'pkgconfig')
optdepends=('rxvt-unicode: The terminal emulator used in the default config.'
            'dmenu: As menu.'
            'i3lock: For locking your screen.'
            'i3status: To display system information with a bar.'
            'perl-json-xs: For i3-save-tree'
            'perl-anyevent-i3: For i3-save-tree')
options=('docs' '!strip')
source=('git://github.com/Airblader/i3#branch=gaps')
sha1sums=('SKIP')

_gitname='i3'

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --tags | sed 's/-/./g'
}

build() {
  cd "$_gitname"
  make
  make -C man
}

package() {
  cd "$_gitname"

  make DESTDIR="$pkgdir/" install

  install -Dm644 man/i3.1 \
    "${pkgdir}/usr/share/man/man1/i3.1"
  install -Dm644 man/i3bar.1 \
    "${pkgdir}/usr/share/man/man1/i3bar.1"
  install -Dm644 man/i3-config-wizard.1 \
    "${pkgdir}/usr/share/man/man1/i3-config-wizard.1"
  install -Dm644 man/i3-input.1 \
    "${pkgdir}/usr/share/man/man1/i3-input.1"
  install -Dm644 man/i3-msg.1 \
    "${pkgdir}/usr/share/man/man1/i3-msg.1"
  install -Dm644 man/i3-migrate-config-to-v4.1 \
    "${pkgdir}/usr/share/man/man1/i3-migrate-config-to-v4.1"
  install -Dm644 man/i3-nagbar.1 \
    "${pkgdir}/usr/share/man/man1/i3-nagbar.1"
  install -Dm644 man/i3-dmenu-desktop.1 \
    "${pkgdir}/usr/share/man/man1/i3-dmenu-desktop.1"
  install -Dm644 man/i3-dump-log.1 \
    "${pkgdir}/usr/share/man/man1/i3-dump-log.1"
  install -Dm644 man/i3-sensible-editor.1 \
    "${pkgdir}/usr/share/man/man1/i3-sensible-editor.1"
  install -Dm644 man/i3-sensible-pager.1 \
    "${pkgdir}/usr/share/man/man1/i3-sensible-pager.1"
  install -Dm644 man/i3-sensible-terminal.1 \
    "${pkgdir}/usr/share/man/man1/i3-sensible-terminal.1"

  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

