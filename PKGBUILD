# Maintainer: Martin Stolpe <martin dot stolpe at gmail dot com>
# Contributor Aimilius <aimilius at protonmail dot com>
# Contributor: Antonio Rojas <arojas@archlinux.org> 

_pkgname=discover
pkgname=discover-git
pkgver=r7860.34d82541
pkgrel=1
pkgdesc='KDE and Plasma resources management GUI'
arch=(x86_64)
url='https://userbase.kde.org/Discover'
license=(LGPL)
depends=(knewstuff-git kitemmodels-git kdeclarative-git qt5-graphicaleffects appstream-qt archlinux-appstream-data
         hicolor-icon-theme kirigami-git discount kuserfeedback)
makedepends=(extra-cmake-modules plasma-framework-git packagekit-qt5 flatpak fwupd git)
optdepends=('packagekit-qt5: to manage packages from Arch Linux repositories' 'flatpak: Flatpak packages support'
            'fwupd: firmware update support')
groups=(plasma)
conflicts=(discover)
provides=(discover)
source=("git+https://invent.kde.org/plasma/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
