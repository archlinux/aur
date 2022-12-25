# Maintainer: Solomon Choina <shlomochoina at gmail.com>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thomas Dziedzic <gostrc@gmail.com>
# Contributor: J. W. Birdsong <jwbirdsong@gmail.com>

_disable_tests=1 #disable tests
pkgname=luakit-git
_gitname=luakit
epoch=1
pkgver=2.2.r75.g68e4ffc7
pkgrel=1
pkgdesc='Luakit: now updated for WebKit 2'
arch=('x86_64' 'i686' 'armv7h')
srcurl='https://github.com/luakit/luakit'
url='https://luakit.github.io'
license=('GPL3')
makedepends=('git' 'pkg-config')
checkdepends=('xorg-server-xvfb' 'lua51-luacheck' 'lua51-luassert' 'lua51-filesystem')
provides=('luakit')
conflicts=('luakit')
depends=('webkit2gtk' 'luajit')
backup=('etc/xdg/luakit/rc.lua'
        'etc/xdg/luakit/theme.lua')
source=(git+"$srcurl".git#branch=develop)
md5sums=('SKIP')

pkgver() {
   cd "$srcdir/$_gitname"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_gitname}"
  make  DEVELOPMENT_PATHS=0 USE_LUAJIT=1 PREFIX=/usr all
}

check(){
 cd "${srcdir}/${_gitname}"
 if (("${_disable_tests}" ==1 )); then
   msg "tests are disabled"
 else
  make run-tests
fi
}

package() {
  cd "${srcdir}/${_gitname}"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
