# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>
# Contributor: Christian Babeux <christian.babeux@0x80.ca>
# Contributor: quantax -- contact via Arch Linux forum or AUR
# Contributor: Federico Cinelli <cinelli.federico@gmail.com>

pkgname=irssi-otr-git
pkgver=1.0.0.221.4ad3b7b
pkgrel=1
epoch=1
pkgdesc="Off-the-Record Messaging (OTR) for the Irssi IRC client"
url="https://github.com/cryptodotis/irssi-otr"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('irssi' 'libotr' 'glib2')
makedepends=('git')
provides=('irssi-otr')
conflicts=('irssi-otr')
replaces=('irssi-otr4-git')
source=(${pkgname}::git+https://github.com/cryptodotis/irssi-otr.git)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0|sed 's/^v//')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname}
  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim: ts=2 sw=2 et:
