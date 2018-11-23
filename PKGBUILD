pkgname=todour-git
pkgver=r56.d34867d
pkgrel=1
pkgdesc="An application for handling todo.txt files."
arch=('i686' 'x86_64')
url="https://nerdur.com/todour-pl/"
license=('GPL')
depends=('qt5-base')
makedepends=('qt5-base')
conflicts=(todour)
provides=(todour)
source=(
    'git://github.com/SverrirValgeirsson/todour.git'
    'git://github.com/falceeffect/UGlobalHotkey.git'
    'git://github.com/gamecreature/QtAwesome.git'
  )
md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd todour
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd todour
  git submodule init
  git config submodule.UGlobalHotkey.url $srcdir/UGlobalHotkey
  git config submodule.QtAwesome.url $srcdir/QtAwesome
  git submodule update
}

build() {
  cd todour
  qmake
  make
}

package() {
  cd todour
  install -dm755 ${pkgdir}/usr/bin
  install -m755 Todour ${pkgdir}/usr/bin/
}
