# Maintainer: Jure Varlec <jure@varlec.si>
# Contributor: Howard Cheung <mail@h-cheung.cf>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Ingo Bürk <admin at airblader dot de>

_reponame=i3-gaps-kde
pkgname=${_reponame}-git
pkgver=4.20.1
pkgrel=1
pkgdesc='A fork of i3wm tiling window manager with more features, including gaps (with KDE patches)'
arch=('i686' 'x86_64')
url='https://github.com/exzombie/i3-gaps-kde'
license=('BSD')
provides=('i3-wm')
conflicts=('i3-wm')
groups=('i3')
depends=('xcb-util-keysyms' 'xcb-util-wm' 'libev' 'yajl'
         'startup-notification' 'pango' 'perl' 'xcb-util-cursor' 'xcb-util-xrm'
         'libxkbcommon-x11')
makedepends=('bison' 'flex' 'asciidoc' 'xmlto' 'meson')
optdepends=('rxvt-unicode: The terminal emulator used in the default config.'
            'dmenu: As menu.'
            'i3lock: For locking your screen.'
            'i3status: To display system information with a bar.'
            'perl-json-xs: For i3-save-tree'
            'perl-anyevent-i3: For i3-save-tree')
backup=(etc/i3/config)
options=('docs' 'debug')
source=("git+https://github.com/exzombie/${_reponame}.git#branch=release-${pkgver}-kde")
sha256sums=('SKIP')

build() {
  cd "${_reponame}"
  arch-meson \
    -Ddocs=true \
    -Dmans=true \
  ../build
  meson compile -C ../build
}

package() {
  cd "${_reponame}"
  DESTDIR="$pkgdir" meson install -C ../build
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 LICENSE
}

# vim:set ts=2 sw=2 et:
