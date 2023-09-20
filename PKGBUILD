# Maintainer:
# Contributor: Zanny <lordzanny@gmail.com>
# Contributor: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

_pkgname="telepathy-kde-accounts-kcm"
pkgname="$_pkgname-git"
_gitname="ktp-accounts-kcm"
pkgver=19.12.3.r115.g33c2d38
pkgrel=1
pkgdesc='KCM Module for configuring Telepathy Instant Messaging Accounts'
arch=(x86_64)
url='https://invent.kde.org/network/ktp-accounts-kcm'
# url='https://community.kde.org/Real-Time_Communication_and_Collaboration'
license=(GPL)

depends=(
  kaccounts-integration
  telepathy-qt
)
makedepends=(
  extra-cmake-modules
  intltool
)

if [ x"$_pkgname" != x"$pkgname" ] ; then
  provides=(telepathy-kde-accounts-kcm)
  conflicts=(telepathy-kde-accounts-kcm)
fi

_pkgsrc="$_gitname"
source=(
  "$_gitname"::"git+https://invent.kde.org/network/ktp-accounts-kcm.git"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$srcdir/$_pkgsrc"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "$_pkgsrc"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
