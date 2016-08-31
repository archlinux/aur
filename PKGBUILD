# $Id$
# Maintainer: Thorsten Töpper <atsutane-tu@freethoughts.de>

pkgname=i3lock-epita
pkgver=2.8.epita.2
pkgrel=1
pkgdesc="An improved screenlocker based upon XCB and PAM - epita's version"
arch=('i686' 'x86_64')
url="https://github.com/lse/i3lock"
license=('MIT')
groups=("i3")
depends=('xcb-util-image' 'libev' 'cairo' 'libxkbcommon-x11')
options=('docs')
backup=("etc/pam.d/i3lock")
replaces=("i3lock")
source=("https://github.com/lse/i3lock/archive/v2.8-epita-2.tar.gz")
md5sums=('7ebd3350d2f4ff2814b15c102ce21f03')

build() {
  cd "${srcdir}/i3lock-2.8-epita-2/"

  # Fix ticket FS#31544, sed line taken from gentoo
  sed -i -e 's:login:system-auth:' i3lock.pam

  make
  gzip i3lock.1
}

package() {
  cd "${srcdir}/i3lock-2.8-epita-2/"
  make DESTDIR="${pkgdir}" install

  install -Dm644 i3lock.1.gz ${pkgdir}/usr/share/man/man1/i3lock.1.gz
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  make clean
}

# vim:set ts=2 sw=2 et:

