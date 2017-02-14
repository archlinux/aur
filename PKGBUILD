# Maintainer:
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thomas Dziedzic <gostrc@gmail.com>
# Contributor: J. W. Birdsong <jwbirdsong@gmail.com>

pkgname=luakit
pkgver=2016.08.30
pkgrel=3
pkgdesc='Browser framework based on Webkit and Lua'
arch=('x86_64' 'i686' 'armv7h')
url='https://github.com/luakit/luakit'
license=('GPL3')
makedepends=('help2man' 'git')
depends=('webkitgtk2' 'lua51-filesystem' 'libunique' 'luajit')
backup=('etc/xdg/luakit/binds.lua'
        'etc/xdg/luakit/globals.lua'
        'etc/xdg/luakit/modes.lua'
        'etc/xdg/luakit/rc.lua'
        'etc/xdg/luakit/theme.lua'
        'etc/xdg/luakit/webview.lua'
        'etc/xdg/luakit/window.lua')
options=('!makeflags')
source=("git://github.com/luakit/luakit.git#commit=cd8487a")
md5sums=('SKIP')

prepare() {
  sed -i '1s,lua,luajit,' luakit/build-utils/gentokens.lua
}

build() {
  make -C luakit USE_LUAJIT=1 PREFIX=/usr all
}

package() {
  make -C luakit PREFIX=/usr DESTDIR="$pkgdir" install
  chmod -x "$pkgdir/usr/share/pixmaps/luakit.png"
  chmod -x "$pkgdir/usr/share/applications/luakit.desktop"
}

# vim:set ts=2 sw=2 et:
