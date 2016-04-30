# Upstream Maintainer (i3-wm): Thorsten Töpper <atsutane-tu@freethoughts.de>
# Patch Contributor: Marius Muja <mariusm@cs.ubc.ca>
# Patch Contributor: mickael9 <mickael9@gmail.com>
# Package Maintainer: cornholio <vigo.the.unholy.carpathian@gmail.com>

pkgname=i3-wm-iconpatch
_pkgsourcename=i3
pkgver=4.12
pkgrel=1
pkgdesc='An improved dynamic tiling window manager (with titlebar icon patch)'
arch=('i686' 'x86_64')
url='http://i3wm.org/'
license=('BSD')
provides=('i3-wm')
conflicts=('i3-wm')
groups=('i3')
depends=('xcb-util-cursor' 'xcb-util-keysyms' 'xcb-util-wm' 'libev' 'yajl'
         'startup-notification' 'pango' 'libxkbcommon-x11')
makedepends=('bison' 'flex' 'pkg-config')
optdepends=('dmenu: As menu.'
            'i3lock: For locking your screen.'
            'i3status: To display systeminformation with a bar.')
options=('docs' '!strip')
source=("http://i3wm.org/downloads/${_pkgsourcename}-${pkgver}.tar.bz2"
        "http://i3wm.org/downloads/${_pkgsourcename}-${pkgver}.tar.bz2.asc"
        "iconsupport.patch")
sha1sums=('264e682c7404ee8d5da76e3d652c546db1662a2b'
          'SKIP'
          'e279bed82dc0a5cbd9f1f17370f47decba5c6970')

build() {
  cd "$srcdir/$_pkgsourcename-$pkgver"
  
  # Apply icon titlebar patch
  patch -p1 < "$srcdir/iconsupport.patch"

  # In order to avoid problems with bison use only a single process
  MAKEFLAGS="-j1"
  make
}

package() {
  cd "$srcdir/$_pkgsourcename-$pkgver"

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
