# Maintainer: 0xDEADCADE <0xdeadcade at protonmail dot com>
pkgname="shin-git"
_pkgname="shin"
pkgver=1.0.0.r1.g7373a4f
pkgrel=4
pkgdesc="A shell in every text input on your system"
arch=("x86_64")
url="https://github.com/p-e-w/shin"
license=("GPL3")
depends=("ibus")
makedepends=("go" "git")
conflicts=("shin")
provides=("shin")
source=("${_pkgname}::git+${url}.git")
sha256sums=("SKIP")
install="${_pkgname}.install"

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" PREFIX="/usr"
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
  sed -i "s|${pkgdir}||g" "${pkgdir}/usr/share/ibus/component/shin.xml"
}
