# Contributor: Ivy Foster <joyfulgirl@archlinux.us>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=luapdf-git
pkgver=r143.904d533
pkgrel=1
epoch=
pkgdesc="Micro-PDF framework extensible in lua."
arch=('i686' 'x86_64')
url="https://github.com/karottenreibe/luapdf"
license=('GPLv3')
groups=()
depends=('lua' 'lua-filesystem' 'poppler-glib' 'gtk2' 'libunique')
makedepends=('git' 'help2man')
optdepends=('luajit: just-in-time compilation')
checkdepends=()
provides=('luapdf')
conflicts=('luapdf')
replaces=()
backup=('etc/xdg/luapdf/binds.lua'
        'etc/xdg/luapdf/document.lua'
        'etc/xdg/luapdf/globals.lua'
        'etc/xdg/luapdf/modes.lua'
        'etc/xdg/luapdf/rc.lua'
        'etc/xdg/luapdf/theme.lua'
        'etc/xdg/luapdf/window.lua')
options=()
changelog=ChangeLog
install=
source=("$pkgname::git+https://github.com/karottenreibe/luapdf.git") 
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

#prepare() {
#  cd "$srcdir/$pkgname"
#  ./autogen.sh
#}

build() {
  cd "$srcdir/$pkgname"
  _makeopts="DEVELOPMENT_PATHS=0 PREFIX=/usr"
  chmod +x build-utils/{getversion.sh,gentokens.lua}
  make $_makeopts all
}

package() {
  cd "$srcdir/$pkgname"
  make $_makeopts DESTDIR="$pkgdir/" install
}

