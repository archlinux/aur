# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Simon Cruanes <simon.cruanes.2007@m4x.org>
pkgname=kristall
pkgver=0.4
pkgrel=4
pkgdesc="A high-quality visual cross-platform gemini browser."
arch=('x86_64')
url="https://kristall.random-projects.net"
license=('GPL-3.0-or-later')
depends=(
  'openssl'
  'qt5-base'
  'qt5-multimedia'
  'qt5-svg'
)
makedepends=(
  'git'
  'qt5-tools'
)
source=("git+https://github.com/MasterQ32/kristall.git#tag=V$pkgver"
        'makefile.patch')
sha256sums=('4b48ae36f08f8956678c9aba92205f45257746232e807e8ea5cabf7d07c7c7f5'
            '283db7c431eda32d9fc385702847352c7cfc5528b9a2f99fb05256c973f6ea3e')

prepare() {
  cd "$pkgname"

  # Make sure qmake-qt5 is used
  # https://github.com/ikskuh/kristall/blob/master/BUILDING.md#notes-for-fedora-32-and-probably-other-recent-versions
  patch -Np1 -i ../makefile.patch
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  make PREFIX='/usr' DESTDIR="$pkgdir" install
}
