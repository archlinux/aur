# Maintainer:
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thomas Dziedzic <gostrc@gmail.com>
# Contributor: J. W. Birdsong <jwbirdsong@gmail.com>

pkgname=luakit-git
_gitname=luakit
pkgver=2017.08.10.r92.g603dd178
pkgrel=1
pkgdesc='Luakit: now updated for WebKit 2'
arch=('x86_64' 'i686' 'armv7h')
srcurl='https://github.com/luakit/luakit'
url='https://luakit.github.io'
license=('GPL3')
makedepends=('git' 'pkg-config')
checkdepends=('xorg-server-xvfb' 'lua51-luacheck' 'lua51-luassert' )
provides=('luakit')
conflicts=('luakit')
depends=('webkit2gtk' 'lua51-filesystem' 'luajit')
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

#check(){
# cd "${srcdir}/${_gitname}"
# make run-tests
#}

package() {
  cd "${srcdir}/${_gitname}"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
