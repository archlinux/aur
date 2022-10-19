# Maintainer: Mingi Sung <FiestaLake@protonmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Radim Hvizdák <hvizdakr at gmail dot com>

pkgname=ibus-hangul-git
_pkgname=ibus-hangul
pkgver=1.5.4+r2+g24bf7fc
pkgrel=1
pkgdesc='Korean input engine for IBus'
arch=('x86_64')
url='https://github.com/libhangul/ibus-hangul'
license=('GPL')
depends=('ibus' 'libhangul' 'iso-codes' 'gtk-update-icon-cache' 'python-gobject')
makedepends=('intltool' 'gnome-common')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

build() {
  cd ${_pkgname}
  autoreconf --verbose --force --install
  ./configure --prefix=/usr --libexecdir=/usr/lib/ibus
  make
}

package() {
  cd ${_pkgname}
  make NO_INDEX=true DESTDIR="${pkgdir}" install

  # Fix symlink
  ln -sf ../lib/ibus/ibus-setup-hangul "$pkgdir/usr/bin/ibus-setup-hangul"
}
