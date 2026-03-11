# Maintainer: Serhii Starovoitov <drommer.94@gmail.com>

_pkgname=yakuake
pkgname=yakuake-wayland
pkgver=25.12.3
pkgrel=1
pkgdesc='Drop-down terminal for KDE with patches to temporarily resolve issues with Keep Above mode and window focus in Wayland'
arch=('x86_64')
url='https://apps.kde.org/yakuake'
license=('GPL-2.0-or-later')
depends=('gcc-libs' 'glibc' 'karchive' 'kcolorscheme' 'kconfig' 'kconfigwidgets' 'kcoreaddons'
         'kcrash' 'kdbusaddons' 'kglobalaccel' 'ki18n' 'kiconthemes' 'kio' 'knewstuff'
         'knotifications' 'knotifyconfig' 'konsole' 'kparts' 'kstatusnotifieritem' 'kwayland'
         'kwidgetsaddons' 'kwindowsystem' 'kxmlgui' 'libx11' 'qt6-base')
makedepends=('extra-cmake-modules' 'vulkan-headers')
provides=('yakuake')
conflicts=('yakuake')
source=("https://download.kde.org/stable/release-service/$pkgver/src/$_pkgname-$pkgver.tar.xz"
        "https://invent.kde.org/utilities/yakuake/-/merge_requests/91.patch"
        "https://invent.kde.org/utilities/yakuake/-/merge_requests/137.patch")
sha256sums=('362c9d376c4ff451d42777f8f8f9f21f2042cecb117f1b5cf2da77b10a43c9df'
            '67d31d17fa83c41f8d87d969b76ae0ac882aee6dafebf7e144035d7804c0230b'
            '6c7401e3150f9a63ca8fb59e434e6c459e0eb134efe89cfa5852792e0334fe0e')

prepare() {
  cd $_pkgname-$pkgver
  patch -Np1 -i "$srcdir/91.patch"
  patch -Np1 -i "$srcdir/137.patch"
}

build() {
  cmake -B build -S $_pkgname-$pkgver -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
