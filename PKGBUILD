# Maintainer: TingPing tingping@tingping.se

pkgname=hexchat-git
pkgver=v2.12.4.r72.gc6f3fbd1
pkgrel=1
pkgdesc='A GTK+ based IRC client'
arch=('i686' 'x86_64' 'armv6h')
url='https://hexchat.github.io'
license=('GPL')
depends=('gtk2' 'openssl' 'dbus-glib' 'luajit'
         'libcanberra' 'libnotify' 'libproxy' 
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

  _ver=`git describe --tags $(git rev-list --tags --max-count=1)`
  _rev=`git describe | sed 's/^v[^-]*-/r/; s/-/./'`
  echo "$_ver.$_rev"
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
