# Upstream Maintainer: Thorsten Toepper <atsutane at freethoughts dot de>
# Maintainer: Daniel Selinger <daniel@slite.org>

pkgname=i3-kde
pkgver=4.10.2
pkgrel=1
pkgdesc='An improved dynamic tiling window manager (with KDE patches)'
arch=('i686' 'x86_64')
url='http://i3wm.org/'
license=('BSD')
provides=('i3-wm')
conflicts=('i3-wm' 'i3bar')
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
source=('git+https://github.com/sLite/i3.git#branch=all-master')
sha1sums=('SKIP')

_gitname='i3'

build() {
  cd "$_gitname"
  make
  make -C man
}

package() {
  cd "$_gitname"

  make DESTDIR="$pkgdir/" install

  install -Dm644 man/i3.1 \
    ${pkgdir}/usr/share/man/man1/i3.1
  install -Dm644 man/i3bar.1 \
    ${pkgdir}/usr/share/man/man1/i3bar.1
  install -Dm644 man/i3-config-wizard.1 \
    ${pkgdir}/usr/share/man/man1/i3-config-wizard.1
  install -Dm644 man/i3-input.1 \
    ${pkgdir}/usr/share/man/man1/i3-input.1
  install -Dm644 man/i3-msg.1 \
    ${pkgdir}/usr/share/man/man1/i3-msg.1
  install -Dm644 man/i3-migrate-config-to-v4.1 \
    ${pkgdir}/usr/share/man/man1/i3-migrate-config-to-v4.1
  install -Dm644 man/i3-nagbar.1 \
    ${pkgdir}/usr/share/man/man1/i3-nagbar.1
  install -Dm644 man/i3-dmenu-desktop.1 \
    ${pkgdir}/usr/share/man/man1/i3-dmenu-desktop.1
  install -Dm644 man/i3-dump-log.1 \
    ${pkgdir}/usr/share/man/man1/i3-dump-log.1
  install -Dm644 man/i3-sensible-editor.1 \
    ${pkgdir}/usr/share/man/man1/i3-sensible-editor.1
  install -Dm644 man/i3-sensible-pager.1 \
    ${pkgdir}/usr/share/man/man1/i3-sensible-pager.1
  install -Dm644 man/i3-sensible-terminal.1 \
    ${pkgdir}/usr/share/man/man1/i3-sensible-terminal.1

  install -Dm644 LICENSE \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  make clean
}

# vim:set ts=2 sw=2 et:

