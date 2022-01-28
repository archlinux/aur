# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: aksr <aksr at t-com dot me>
# Contributor: TDY <tdy@archlinux.info>
# Contributor: Dan Vratil <progdan@progdansoft.com>


pkgname=libviper
pkgver=3.1.1
pkgrel=1
_commit=d8b95263abeba72f281b6906ff96cdc36964a704
pkgdesc="API for ncurses/libgpm offering simple window creation and management to quickly create text interfaces"
arch=('i686' 'x86_64')
url="https://github.com/TragicWarrior/libviper"
license=('GPL2')
depends=('glibc>=2.8' 'gpm' 'ncurses>=5.4')
makedepends=('cmake' 'git')
source=("git+https://github.com/TragicWarrior/${pkgname}.git#commit=${_commit}"
        "ncurses-import.patch")
sha256sums=('SKIP'
            '06ad5fde54fcc18e4ece0316a1917c18039784a9812bc86908ed9e6be46b26cf')


prepare() {
  mkdir -p build
  patch -Np0 -i ncurses-import.patch
}

build() {
  cd build
  cmake ../${pkgname} \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}

