# Maintainer: sfs <sfslinux@gmail.com>

pkgname=gtkdialog-git
_pkgname=gtkdialog
pkgver=r404.e1577ad
pkgrel=1
pkgdesc="A small utility for fast and easy GUI building"
arch=('i686' 'x86_64' 'arm')
url="https://github.com/01micko/gtkdialog"
license=('GPL')
depends=( 'gtk3')
makedepends=( 'git' 'meson' 'ninja' )
provides=('gtkdialog')
conflicts=('gtkdialog')

source=('git+'${url}'')
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson "$srcdir/${_pkgname}" build \
   -D vte=true \
   -D libnotify=true \
   -D docs=true \
   -D bash=true
   
  meson compile -C build
}
package() {
  DESTDIR="${pkgdir}" ninja -C build install
  cd $pkgdir/usr/bin && ln -s gtk3dialog gtkdialog
}
