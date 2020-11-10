# Maintainer: Nikita Boldasov <renom7 at gmail dot com>

pkgname=lightdm-qt5-greeter-git
_pkgname=lightdm-qt5-greeter
_giturl=https://github.com/rezso/$_pkgname
pkgver=r111.ddba411
pkgrel=1
pkgdesc='lightdm-qt5-greeter is a simple frontend for the lightdm displaymanager, written in c++ and qt5.'
arch=('x86_64')
url='https://github.com/rezso/lightdm-qt5-greeter'
license=('LGPL2.1')
depends=('qt5-base' 'liblightdm-qt5' 'lightdm')
makedepends=('cmake' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
backup=("etc/lightdm/$_pkgname.conf")
source=("$_pkgname::git+$_giturl.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"

  mkdir build
}

build() {
  cd $_pkgname/build

  cmake ..

  make
}

package() {
  cd $_pkgname/build

  make DESTDIR="$pkgdir/" install
}

