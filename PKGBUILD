# Maintainer: David <aur@david.davidlane.io>
# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=selectdefaultapplication-git
pkgver=r19.73a7579
pkgrel=2
pkgdesc='A very simple application that lets you define default applications on Linux in a sane way'
arch=('i686' 'x86_64')
url='https://github.com/sandsmark/selectdefaultapplication'
license=('GPL')
depends=('qt5-base' 'hicolor-icon-theme')
makedepends=('git')
source=("git+https://github.com/sandsmark/selectdefaultapplication.git")
md5sums=('SKIP')

pkgver() {
  cd selectdefaultapplication
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd selectdefaultapplication
  qmake
  make
}

package() {
  cd selectdefaultapplication
  install -dm755 ${pkgdir}/usr/bin/
  install -m755 selectdefaultapplication ${pkgdir}/usr/bin/

  install -dm755 ${pkgdir}/usr/share/applications/
  install -m644 selectdefaultapplication.desktop ${pkgdir}/usr/share/applications/
  install -dm755 ${pkgdir}/usr/share/icons/hicolor/48x48/apps/
  install -m644 selectdefaultapplication.png ${pkgdir}/usr/share/icons/hicolor/48x48/apps/
}
