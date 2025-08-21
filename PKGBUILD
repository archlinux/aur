# Maintainer: tippfehlr <tippfehlr@tippfehlr.dev>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Vamp898 <vamp898@web.de>
# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Todd Maynard <arch@toddmaynard.com>

pkgname=kmymoney-git
pkgver=5.2.1.r29.g25c253c
pkgrel=1
pkgdesc="Personal finance manager for KDE which operates similarly to MS-Money or Quicken"
arch=('x86_64')
url="https://kmymoney.org/"
license=('GPL-2.0-or-later')
depends=('glibc' 'gcc-libs' 'gmp' 'libalkimia' 'sqlcipher' 'qt6-base' 'qt6-5compat' 'gpgmepp' 'karchive'
         'kcoreaddons' 'kconfig' 'kwidgetsaddons' 'ki18n' 'kcompletion' 'kcmutils' 'kitemmodels'
         'kitemviews' 'kxmlgui' 'ktextwidgets' 'kio' 'kholidays' 'kjobwidgets' 'sonnet'
         'kcolorscheme' 'kconfigwidgets' 'kdiagram' 'libical' 'libofx' 'qtkeychain-qt6'
         'kidentitymanagement' 'libakonadi' 'kcontacts' 'aqbanking' 'gwenhywfar')
makedepends=('extra-cmake-modules' 'kdoctools' 'doxygen' 'qgpgme')
optdepends=('perl: for financequote.pl')
provides=('kmymoney')
conflicts=('kmymoney')
source=('git+https://invent.kde.org/office/kmymoney.git#branch=5.2')
sha256sums=('SKIP')

pkgver() {
  cd kmymoney
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S kmymoney \
    -DBUILD_WITH_QT6=ON \
    -DCMAKE_SKIP_RPATH=YES \
    -DBUILD_TESTING=OFF \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
