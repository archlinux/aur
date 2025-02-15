# Maintainer: tippfehlr <tippfehlr@tippfehlr.eu>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Vamp898 <vamp898@web.de>
# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Todd Maynard <arch@toddmaynard.com>

pkgname=kmymoney-git
pkgver=5.1.92.r18.gd47e1bf
pkgrel=1
pkgdesc="Personal finance manager for KDE which operates similarly to MS-Money or Quicken"
arch=('x86_64')
url="https://kmymoney.org/"
license=('GPL')
depends=('aqbanking' 'gwenhywfar' 'libalkimia-git' 'sqlcipher' 'qt5-base' 'qt5-webengine' 'gpgme' 'karchive5'
         'kcoreaddons5' 'kconfig5' 'kwidgetsaddons5' 'ki18n5' 'kcompletion5' 'kcmutils5' 'kitemmodels5'
         'kitemviews5' 'kservice5' 'kwallet5' 'kiconthemes5' 'kxmlgui5' 'kidentitymanagement5'
         'ktextwidgets5' 'knotifications5' 'kio5' 'kholidays5' 'kactivities5'
         'kqtquickcharts' 'kdiagram5' 'kcontacts5' 'libical' 'libakonadi5' 'shared-mime-info' 'libofx')
makedepends=('extra-cmake-modules' 'kdoctools5' 'doxygen' 'git')
optdepends=('perl: for financequote.pl')
provides=(kmymoney)
conflicts=(kmymoney)
source=('git+https://invent.kde.org/office/kmymoney.git/')
sha256sums=('SKIP')

pkgver() {
  cd kmymoney
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd kmymoney

  mkdir -p build
  cd build

  cmake ../ \
    -DENABLE_WEBENGINE=ON \
    -DCMAKE_SKIP_RPATH=YES \
    -Wno-dev
  make
}

package() {
  cd kmymoney/build

  make DESTDIR="${pkgdir}" install
}
