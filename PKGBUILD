# Maintainer:
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thomas Dziedzic <gostrc@gmail.com>
# Contributor: J. W. Birdsong <jwbirdsong@gmail.com>

pkgname=luakit-git
gitname=luakit
pkgver=2017.08.10.r0.gc5328c22
pkgrel=3
pkgdesc='Luakit: now updated for WebKit 2'
arch=('x86_64' 'i686' 'armv7h')
url='https://github.com/luakit/luakit'
license=('GPL3')
makedepends=('git' 'pkg-config')
checkdepends=('xorg-server-xvfb' 'lua51-luacheck' 'lua51-luassert' )
provides=('luakit')
conflicts=('luakit')
depends=('webkit2gtk' 'lua51-filesystem' 'luajit')
#backup=('etc/xdg/luakit/binds.lua'
#        'etc/xdg/luakit/globals.lua'
#        'etc/xdg/luakit/modes.lua'
#        'etc/xdg/luakit/rc.lua'
#        'etc/xdg/luakit/theme.lua'
#        'etc/xdg/luakit/webview.lua'
#        'etc/xdg/luakit/window.lua')
source=("git://github.com/luakit/luakit#branch=develop")
md5sums=('SKIP')

pkgver() {
   cd "$srcdir/$gitname"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${gitname}"
  make  DEVELOPMENT_PATHS=0 USE_LUAJIT=1 PREFIX=/usr all
}

check(){
 cd "${srcdir}/${gitname}"
 make run-tests
}

package() {
  cd "${srcdir}/${gitname}"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
