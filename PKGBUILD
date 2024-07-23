# Maintainer: kompowiec2 diasp@o2.pl

pkgname=sonis-fork-of-hexchat
pkgver=2.16.2.r3.gb544ac33
pkgrel=1
pkgdesc='IRC client, fork of hexchat, aimed at preventing crashes, detecting plugin bugs etc.'
arch=('i686' 'x86_64' 'armv6h')
url='https://github.com/SoniEx2/sonis-fork-of-hexchat'
license=('GPL')
depends=('gtk2' 'openssl' 'dbus-glib' 'luajit' 'python-cffi'
         'libcanberra' 'libnotify' 'libproxy' 'pciutils'
         'hicolor-icon-theme' 'desktop-file-utils' 'sound-theme-freedesktop' 'iso-codes')
makedepends=('git' 'perl' 'python' 'meson' 'glib2-devel')
optdepends=('enchant: for spell check'
            'perl: for perl plugin'
            'python: for python plugin')
provides=('hexchat')
conflicts=('hexchat' 'hexchat-lua-git')
replaces=('hexchat-lua-git')
source=('git+https://github.com/SoniEx2/sonis-fork-of-hexchat.git')
md5sums=('SKIP')
_gitname='sonis-fork-of-hexchat'

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

