# Maintainer: Timur Demin <me@tdem.in>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Ingo Bürk <admin at airblader dot de>

# ported from i3-gaps PKGBUILD

pkgname=i3-gaps-desktop
pkgver=4.19.1
pkgrel=1
pkgdesc='A fork of i3-gaps with desktop manager support'
arch=('i686' 'x86_64')
url='https://git.tdem.in/tdemin/i3'
license=('BSD')
provides=('i3-wm')
conflicts=('i3-wm')
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
options=('docs')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}-desktop.tar.gz")
sha256sums=('b81bba72f98f2ecd5d6ce7c3c9b63a234292d07897a44de662d9adbb8e41019a')

build() {
    cd "i3"
    arch-meson \
        -Ddocs=true \
        -Dmans=true \
        ../build
    meson compile -C ../build
}

package() {
    cd "i3"
    DESTDIR="$pkgdir" meson install -C ../build
    install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 LICENSE
}
