# Maintainer: GI_Jack <GI_Jack@hackermail.com>
# Taken from Arch Strike
# Original: ArchStrike <team@archstrike.org>

pkgname=nbtool-git
pkgver=20140415.r2
pkgrel=1
pkgdesc='Some tools for NetBIOS and DNS investigation, attacks, and communication.'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='http://wiki.skullsecurity.org/Nbtool'
source=("${pkgname}::git+https://github.com/iagox86/nbtool.git")
license=('CUSTOM')
depends=('libpcap')
makedepends=('git' 'nasm')
provides=('nbtool' 'dnscat')
replaces=('nbtool')
conflicts=('nbtool')
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "%s.r%s" "$(git show -s --format=%ci master | sed 's/\ .*//g;s/-//g')" "$(git rev-list --count HEAD)"
}

build() {
  cd "${pkgname}"
  make CFLAGS="$CFLAGS"
  sed -i "s|/usr/local/|${pkgdir}/usr/|g" "Makefile"
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
