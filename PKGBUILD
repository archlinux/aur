# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=communicator-git
pkgver=2.1.2.r4.g4c8bde7
pkgrel=1
pkgdesc="Contacts and dialer application"
arch=('x86_64')
groups=('maui-apps')
url="https://invent.kde.org/maui/communicator"
license=('GPL3')
depends=('mauikit-git' 'mauikit-filebrowsing-git' 'mauikit-texteditor-git' 'ki18n' 'kcoreaddons' 'kservice')
makedepends=('git' 'extra-cmake-modules' 'qt5-tools' 'qt5-svg')
provides=('communicator')
conflicts=('communicator')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%%-git}"
  ( set -o pipefail
    git describe --long --tags --first-parent --match 'v[0-9][0-9.][0-9.]*' | \
      sed 's=^v==;s=^\([0-9][0-9.]*\)-\([a-zA-Z]\+\)=\1\2=;s=\([0-9]\+-g\)=r\1=;s=-=.=g'
  )
}

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr -B build -S "${pkgname%%-git}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
