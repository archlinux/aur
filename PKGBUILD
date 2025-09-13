# Maintainer: Foxe Chen <chen.foxe@gmail.com>

pkgname=wvkbd-git
_pkgname=wvkbd
pkgver=v0.18.r0.ged702f9
pkgrel=1
pkgdesc='On-screen keyboard for wlroots (Git version)'
url='https://git.sr.ht/~proycon/wvkbd'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('GPL3')
depends=('wayland' 'pango' 'cairo' 'glibc')
makedepends=('fontconfig' 'libxkbcommon' 'scdoc')
source=("git+https://github.com/jjsullivan5196/wvkbd")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  make LAYOUT=deskintl
}

package() {
  cd "$_pkgname"
  make LAYOUT=deskintl PREFIX=/usr DESTDIR="$pkgdir" install
}

