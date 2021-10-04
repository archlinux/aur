# Maintainer: David Rosenstrauch <darose@darose.net>
# Contributor: Alex Kubica <alexkubicail@gmail.com>
# Contributor: Faule Socke <github@socker.lepus.uberspace.de>
# Contributor: Jakub Klinkovský <kuba.klinkovsky@gmail.com>
# Contributor: Adlai Chandrasekhar <munchking@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Mark Foxwell <fastfret79@archlinux.org.uk>

pkgname=cdm-git
_pkgname="cdm"
pkgver=r170.594d94f
pkgrel=1
pkgdesc="The Console Display Manager"
arch=('any')
url="https://github.com/evertiro/cdm"
license=('GPL')
makedepends=('git')
depends=('dialog' 'xorg-xinit' 'xorg-xdpyinfo' 'kbd')
provides=('cdm')
conflicts=('cdm')
backup=('etc/cdmrc')
source=('git://github.com/evertiro/cdm.git')
md5sums=('SKIP')
epoch=1

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -d ${pkgdir}/{usr/{bin,share/{doc/cdm,cdm/themes}},etc/profile.d}

  cd "$srcdir/$_pkgname"
  install -Dm644 -T README.md "$pkgdir/usr/share/doc/cdm/README"
  install -Dm644 -t "$pkgdir/usr/share/cdm/themes" themes/*

  cd "$srcdir/$_pkgname/src"
  install -Dm755 -t "$pkgdir/usr/bin" cdm cdm-xlaunch
  install -Dm644 -t "$pkgdir/etc" cdmrc
  install -Dm755 -T profile.sh "$pkgdir/etc/profile.d/zzz-cdm.sh"
}
