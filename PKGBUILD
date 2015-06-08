# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: weirdfox <weirdfox@gmail.com>

pkgname=kdeplasma-applets-stdin-svn
pkgver=r57
pkgrel=1
_pkgname=plasmoidstdin
_pkgver=0.2
pkgdesc="This plasmoid executes a process and captures its stdout or stderr output stream"
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/STDIN+Plasmoid?content=92309"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('automoc4' 'cmake' 'subversion')
source=(${pkgname}::svn+https://svn.code.sf.net/p/${_pkgname}/code/${_pkgver}/branches/${_pkgver}-workarounds)
install=${pkgname}.install
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
  rm -rf "${srcdir}/build"
  mkdir "${srcdir}/build"
}

build() {
  cd "${srcdir}/build"
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
        -DCMAKE_BUILD_TYPE=Release \
        ../${pkgname}
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}
