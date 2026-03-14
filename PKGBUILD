# Maintainer: schlndh <schlindenbuch.h@seznam.cz>
_pkgname=plasma-wayland-protocols
pkgname=$_pkgname-povd
pkgver=1.20.0
pkgrel=3
pkgdesc='Plasma Specific Protocols for Wayland (patched for per-output virtual destkops)'
arch=(any)
url='https://kde.org/plasma-desktop'
license=(LGPL-2.0-or-later)
depends=()
makedepends=(extra-cmake-modules
             qt6-base)
provides=($_pkgname)
conflicts=($_pkgname)
source=(https://download.kde.org/stable/$_pkgname/$_pkgname-$pkgver.tar.xz{,.sig}
        povd.patch)
sha256sums=('9818bb1462211ce5982e670abf0d964eb11fe1d0c02a1c26084db30695a79d6a'
            'SKIP'
            'b0f4d5ce232fe98c075107d9060233c6fb7e5b3f4473e8c7940ce2114f3b4d43')
validpgpkeys=(CA1B4E348D22755A67EF4E1A6A4F2C4CDC8BC77F  # Aleix Pol Gonzalez <aleixpol@kde.org>
              EC5516B514543DA145169FD12276F09AF4A790F4  # Vlad Zahorodnii <vlad.zahorodnii@kde.org>
              E0A3EB202F8E57528E13E72FD7574483BB57B18D  # Jonathan Esk-Riddell <jr@jriddell.org>
              0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D) # Bhushan Shah (mykolab address) <bshah@mykolab.com>

build() {
  cmake -B build -S $_pkgname-$pkgver
  cmake --build build
}

prepare() {
  cd "$_pkgname-$pkgver"
  patch -p1 < "$srcdir/povd.patch"
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
