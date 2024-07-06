# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=npth-git
pkgver=npth.1.7.r5.g75c6839
pkgrel=1
pkgdesc='The new GNU portable threads library'
arch=(x86_64)
url="https://www.gnupg.org/software/npth/index.html"
license=(LGPL-2.1-or-later)
depends=(glibc sh)
provides=(libnpth.so npth)
conflicts=(npth)
source=(git://git.gnupg.org/npth.git)
sha512sums=('SKIP')
b2sums=('SKIP')
validpgpkeys=(
  'D8692123C4065DEA5E0F3AB5249B39D24F25E3B6'  # Werner Koch (dist sig)
  '46CC730865BB5C78EBABADCF04376F3EE0856959'  # David Shaw (GnuPG Release Signing Key)
  '031EC2536E580D8EA286A9F22071B08A33BD3F06'  # NIIBE Yutaka (GnuPG Release Key) <gniibe@fsij.org>
  'D238EA65D64C67ED4C3073F28A861B1C7EFD60D9'  # Werner Koch (Release Signing Key)
  '6DAA6E64A76D2840571B4902528897B826403ADA'  # Werner Koch (dist signing 2020)
)

pkgver() {
  cd npth
  git describe --long | sed 's/^foo-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd npth
  autoreconf -fiv
}

build() {
  cd npth
  ./configure --prefix=/usr
  make
}

check() {
  make check -C npth
}

package() {
  make DESTDIR="$pkgdir" install -C npth
  install -vDm 644 npth/{README,NEWS,ChangeLog} -t "$pkgdir/usr/share/doc/npth/"
}
