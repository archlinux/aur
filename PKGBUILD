# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: dorphell <dorphell@archlinux.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=ripperx-git
pkgver=2.8.0.r3.g3b9ce8b
pkgrel=1
pkgdesc="GTK2 program to rip and encode mp3 files"
arch=('x86_64')
url="http://ripperx.sourceforge.net/"
depends=('gtk2' 'taglib')
makedepends=('git')
license=('GPL')
source=(${pkgname%-git}::git+https://git.code.sf.net/p/ripperx/git)
md5sums=('SKIP')
conflicts=('ripperx')
provides=('ripperx')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | sed 's+-+.r+'|tr - .
}

build() {
  cd ${pkgname%-git}
  sh ./bootstrap
  CFLAGS="-fpermissive" ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname%-git}
  make DESTDIR="$pkgdir" install
  install -Dm0644 ripperX.desktop "$pkgdir"/usr/share/applications/ripperX.desktop
  install -Dm0644 src/xpms/ripperX-icon.xpm "$pkgdir"/usr/share/pixmaps/ripperX.xpm
}
