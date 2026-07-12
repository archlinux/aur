# Maintainer: AlieeLinux <bazartroy531@gmail.com>

pkgname=qt-sudo-git
pkgver=r39.gf39b911
pkgrel=1
pkgdesc='A clone of LXQt sudo tool, without LXQt libs (Git version)'
arch=('x86_64')
url='https://github.com/aarnt/qt-sudo'
license=('LGPL-2.1-only')
depends=(
  'gcc-libs'
  'glibc'
  'qt6-base'
  'sudo'
)
makedepends=(
  'git'
  'qt6-tools'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/aarnt/qt-sudo.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-git}"

  qmake6 \
    PREFIX=/usr \
    QMAKE_CFLAGS="${CFLAGS}" \
    QMAKE_CXXFLAGS="${CXXFLAGS}" \
    QMAKE_LFLAGS="${LDFLAGS}"

  make
}

package() {
  cd "${pkgname%-git}"

  make INSTALL_ROOT="${pkgdir}" install  
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
