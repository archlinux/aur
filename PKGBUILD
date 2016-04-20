# Maintainer: Ingo Bürk <admin at airblader dot de>

pkgname=i3-gaps
_pkgsourcename=i3
pkgver=4.12
pkgrel=1
pkgdesc='A fork of i3wm tiling window manager with more features, including gaps'
arch=('i686' 'x86_64')
url='https://github.com/Airblader/i3'
license=('BSD')
provides=('i3-wm')
conflicts=('i3-wm' 'i3bar' 'i3bar-git' 'i3-git' 'i3-gaps-git' 'i3-gaps-next-git')
groups=('i3')
depends=('xcb-util-keysyms' 'xcb-util-wm' 'libev' 'yajl'
         'startup-notification' 'pango' 'perl' 'xcb-util-cursor'
         'libxkbcommon-x11')
makedepends=('asciidoc' 'docbook-xsl' 'pkgconfig')
optdepends=('rxvt-unicode: The terminal emulator used in the default config.'
            'dmenu: As menu.'
            'i3lock: For locking your screen.'
            'i3status: To display system information with a bar.'
            'perl-json-xs: For i3-save-tree'
            'perl-anyevent-i3: For i3-save-tree')
options=('docs' '!strip')
source=("https://github.com/Airblader/i3/archive/${pkgver}.tar.gz"
        'fix-out-of-tree-build.patch')
sha1sums=('SKIP' 'SKIP')

build() {
  cd "${srcdir}/${_pkgsourcename}-${pkgver}"

  # This can be removed with 4.13
  patch -p1 -i "${srcdir}/fix-out-of-tree-build.patch"

  make
  make -C man
}

package() {
  cd "${srcdir}/${_pkgsourcename}-${pkgver}"

  make DESTDIR="${pkgdir}/" install

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

