# Maintainer: Josef Vybihal josef.vybihal.gmail.com
# Previous maintainer: TingPing tingping@tingping.se

pkgname=hexchat-git
pkgver=2.14.2.r9.ged553301
pkgrel=1
pkgdesc='A GTK+ based IRC client'
arch=('i686' 'x86_64' 'armv6h')
url='https://hexchat.github.io'
license=('GPL')
depends=('dbus-glib' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk2'
         'libcanberra' 'libnotify' 'libproxy' 'openssl' 'pango' 'pciutils')
makedepends=('git' 'intltool' 'iso-codes' 'lua' 'meson' 'perl' 'python')
optdepends=('enchant: Spell check'
            'iso-codes: Display language names instead of codes'
            'lua: Lua plugin'
            'perl: Perl plugin'
            'python: Python plugin')
provides=('hexchat')
conflicts=('hexchat' 'hexchat-lua-git')
replaces=('hexchat-lua-git')
source=('git://github.com/hexchat/hexchat.git')
md5sums=('SKIP')
_gitname='hexchat'

pkgver() {
  cd "$_gitname"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  #cd "$_gitname"

  #rm -rf _build
  arch-meson ${_gitname} _build \
    --prefix=/usr \
    --buildtype=plain \
    -Dwith-lua='lua' \
    -Dwith-text='true' \
    #-Dwith-python=python2
  ninja -C _build
}

package() {
  #cd "$_gitname"
  env DESTDIR="$pkgdir" ninja -C _build install
}
