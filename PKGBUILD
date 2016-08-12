# Maintainer: Donald Carr<sirspudd at gmail dot com>

# Uncomment for a debug build
#_qmake_args="CONFIG+=debug"
pkgname=artriculate
pkgver=0.1
pkgrel=3
pkgdesc='QML box2d application for displaying artwork'
arch=('any')
url='https://github.com/sirspudd/artriculate'
license=('GPL3')
depends=('qt5-declarative' 'qml-box2d')
source=("git://github.com/sirspudd/artriculate#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$srcdir"/"$pkgname"
  qmake
  make
}

package() {
  local repo_src=${srcdir}/${pkgname}
  local systemd_deploy_path=${pkgdir}/usr/lib/systemd/system
  mkdir -p $systemd_deploy_path
  cp ${repo_src}/resources/*.service ${systemd_deploy_path}

  cd ${repo_src}
  INSTALL_ROOT="$pkgdir" make install
}
