# Maintainer: Ben Isenhart <bisenhar(at)uvm(dot)edu>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdesrc-build
pkgver=19.12
pkgrel=1
pkgdesc="A script to build KDE software from KDE's source repositories"
url='https://kdesrc-build.kde.org/'
arch=('any')
license=('GPL')
depends=('perl-libwww' 'perl-xml-parser' 'dialog' 'perl-json' 'perl-io-socket-ssl' 'perl-net-ssleay' 'perl-yaml-syck')
makedepends=('cmake' 'git')
optdepends=('subversion: download source code using svn'
            'git: download source code using git')
conflicts=('kdesrc-build-git')
source=("git+https://anongit.kde.org/kdesrc-build.git#tag=v${pkgver}")
md5sums=('SKIP')

build() {
  cmake \
	-S kdesrc-build \
	-B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -d "${pkgdir}"/usr/share/doc/samples
  install -Dm644 kdesrc-build/kdesrc-buildrc-kf5-sample \
    "${pkgdir}"/usr/share/doc/samples/
  install -Dm644 kdesrc-build/kf5-{applications,frameworks,kdepim,qt5,workspace}-build-include \
    "${pkgdir}"/usr/share/doc/samples/
}
