# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Ivan Semkin (ivan at semkin dot ru)
# Contributor: realitygaps <realitygaps[at]yahoo[dot]com>

_pkgname=qtpass
pkgname=$_pkgname-git
pkgver=1.3.2.r326.6a6c4f61
pkgrel=1
pkgdesc='A multi-platform GUI for pass'
url='https://qtpass.org'
license=('GPL3')
arch=('x86_64' 'i686')
depends=('qt5-base' 'pass' 'pwgen')
makedepends=('git' 'qt5-tools' 'qt5-svg')
provides=('qtpass')
conflicts=('qtpass')
source=('git+https://github.com/ijhack/qtpass.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo "$(git describe | sed 's/^v//; s/-/.r/; s/-g/./')"
}

prepare() {
  cd "${srcdir}/${_pkgname}" 

  sed -i 's|qtpass-icon|qtpass|' $_pkgname.desktop
}

build() {
  cd "${srcdir}/${_pkgname}"

  qmake-qt5
  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dm0755 "$srcdir/$_pkgname/main/qtpass" "$pkgdir/usr/bin/$_pkgname"
  install -Dm0644 "$srcdir/$_pkgname/artwork/icon.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
  install -Dm0644 "$srcdir/$_pkgname/qtpass.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm0644 "$srcdir/$_pkgname/$_pkgname.1" "$pkgdir/usr/share/man/man1/$_pkgname.1"
} 
# vim:set ts=2 sw=2 et:

