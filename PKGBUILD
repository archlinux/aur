pkgname=xdg-desktop-portal-kde-git
_pkgname=xdg-desktop-portal-kde
pkgver=20260114.4a3e0765
pkgrel=1
pkgdesc='A backend implementation for xdg-desktop-portal that is using Qt/KDE.'
url='https://github.com/KDE/xdg-desktop-portal-kde'
license=('LGPL')
arch=('x86_64')
depends=('xdg-desktop-portal') # Are you sure? in non-git version they are: depends=(kirigami2 plasma-framework)
makedepends=('extra-cmake-modules' 'plasma-wayland-protocols' 'wayland-protocols')
source=('git+https://github.com/KDE/xdg-desktop-portal-kde.git')
sha1sums=('SKIP')
conflicts=('xdg-desktop-portal-kde')
provides=('xdg-desktop-portal-impl' 'xdg-desktop-portal-kde')
install=install

pkgver() { 
    cd "${srcdir}/${_pkgname}"
    git log -1 --format='%cd.%h' --date=short | tr -d - 
}

build() {
  cmake -B build -S $_pkgname \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() { 
    DESTDIR="$pkgdir" cmake --install build
}
