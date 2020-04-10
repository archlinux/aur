# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=sonnet-git
pkgver=r524.2ce07be
pkgrel=2
pkgdesc='Spelling framework for Qt5'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/sonnet'
license=('LGPL')
depends=('qt5-base')
makedepends=('extra-cmake-modules' 'qt5-tools' 'hunspell' 'aspell' 'hspell' 'git') # 'livvoikko'
optdepends=('hunspell: spell checking via hunspell' 'aspell: spell checking via aspell' 'hspell: spell checking for Hebrew')
 # 'libvoikko: spell checking for Finnish via Voikko')
groups=('kf5')
conflicts=('sonnet')
provides=('sonnet')
source=('git://anongit.kde.org/sonnet.git#commit=2ce07be5dff339f6f3e43ebd72b1d94792bb17f7')
md5sums=('SKIP')

pkgver() {
  cd sonnet
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  [[ -d build ]] || mkdir build
  cd build
  cmake ../sonnet \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
