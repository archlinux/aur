# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=pidgin-sipe-git
pkgver=1.25.0.r9.g3db51111
pkgrel=1
pkgdesc="Third-party Pidgin plugin for Microsoft Office 365/Lync/LCS/OCS"
arch=('x86_64')
license=('GPL2')
url="https://sipe.sourceforge.net/"
depends=('gmime' 'libpurple')
makedepends=('git' 'intltool')
optdepends=('freerdp: Desktop sharing' 'krb5: Kerberos support')
provides=('pidgin-sipe')
conflicts=('pidgin-sipe')
source=("${pkgname}"::"git+https://repo.or.cz/siplcs.git#branch=mob")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}"

  ./autogen.sh

  ./configure --prefix=/usr --disable-telepathy --disable-quality-check --with-vv

  make
}

package() {
  cd "${pkgname}"

  make DESTDIR="${pkgdir}" install
}
