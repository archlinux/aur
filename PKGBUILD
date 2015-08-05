# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Cesar Alcalde <lambda512 _at_ gmail.com>

pkgname=qoauth-git
pkgver=v1.0.30.g02fbc13
pkgrel=1
pkgdesc='A Qt-based C++ library for OAuth authorization scheme'
arch=('i686' 'x86_64')
url='https://github.com/ayoy/qoauth'
license=('LGPL3')
depends=('qca-qt5')
makedepends=('git')
provides=('qoauth')
conflicts=('qoauth')
source=("git://github.com/ayoy/qoauth.git"
        'fix_lib_64.patch')
md5sums=('SKIP'
         '75d2e129f4a8b8994b48699d71e170b4')

pkgver() {
  cd qoauth
  local ver="$(git describe --long)"
  printf "%s" "${ver//-/.}"
}

prepare() {
  cd qoauth
  patch -p1 -i "${srcdir}"/fix_lib_64.patch
}

build () {
  cd qoauth
  qmake
  make
}

package() {
  cd qoauth
  make INSTALL_ROOT="${pkgdir}" install
}
