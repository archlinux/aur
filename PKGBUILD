# Maintainer: TingPing tingping@tingping.se

pkgname=hexchat-git
pkgver=2.14.2.r9.ged553301
pkgrel=3
pkgdesc='A GTK+ based IRC client'
arch=('i686' 'x86_64' 'armv6h')
url='https://hexchat.github.io'
license=('GPL')
depends=('gtk2' 'openssl' 'dbus-glib' 'luajit' 'python-cffi'
         'libcanberra' 'libnotify' 'libproxy' 'pciutils'
         'hicolor-icon-theme' 'desktop-file-utils' 'sound-theme-freedesktop' 'iso-codes')
makedepends=('git' 'perl' 'python' 'meson')
optdepends=('enchant: for spell check'
            'perl: for perl plugin'
            'python: for python plugin')
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
  cd "$_gitname"

  rm -rf _build
  meson _build --prefix=/usr --buildtype=plain
  ninja -C _build
}

package() {
  cd "$_gitname"
  env DESTDIR="$pkgdir" ninja -C _build install
}
