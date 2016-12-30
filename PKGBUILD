# Maintainer: Donald Carr<sirspudd@gmail.com>

#set -o nounset
#set -o errexit
#set -o xtrace

pkgname=postal-git
pkgver=0.1
pkgrel=1
pkgdesc='Postal: quirky FPS shooter'
arch=('x86' 'x86_64' 'arm')
url='https://github.com/iammeat/POSTAL-1-Open-Source'
license=('GPL')
depends=('sdl2')
makedepends=('gcc' 'patch')
source=("git+https://github.com/iammeat/POSTAL-1-Open-Source")
sha256sums=('SKIP')
_repo_name="POSTAL-1-Open-Source"

build() {
  cd "$srcdir/$_repo_name"
  patch -p1 < ${startdir}/0001-Use-the-system-SDL2.patch
  make linux_x86=1
}

package() {
  local _data_dir="$pkgdir/usr/share/postal-git"
  local _bin_dir="$pkgdir/usr/bin"

  cd "$srcdir/$_repo_name"

  mkdir -p $_data_dir
  mkdir -p $_bin_dir

  cp ${startdir}/postal-git $_bin_dir
  cp bin/postal1-bin $_data_dir
  cp DefaultPostal.ini $_data_dir/POSTAL.INI
}
