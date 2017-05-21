# Maintainer: Donald Carr<sirspudd@gmail.com>

#set -o nounset
#set -o errexit
#set -o xtrace

pkgname=postal-git
pkgver=314.f58b127b0202
pkgrel=1
pkgdesc='Postal: quirky FPS shooter'
arch=('x86' 'x86_64' 'arm')
url='http://runningwithscissors.com/'
license=('GPL')
depends=('sdl2')
makedepends=('mercurial' 'gcc' 'patch')
source=("hg+https://bitbucket.org/gopostal/postal-1-open-source")
sha256sums=('SKIP')
_repo_name="postal-1-open-source"

pkgver() {
  cd "$srcdir/$_repo_name"
  hg tags | tr -s ' ' | cut -d ' ' -f 2 | tr ':' '.'
}

build() {
  cd "$srcdir/$_repo_name"
  make
}

package() {
  local _data_dir="$pkgdir/usr/share/postal-git"
  local _bin_dir="$pkgdir/usr/bin"

  cd "$srcdir/$_repo_name"

  mkdir -p $_data_dir
  mkdir -p $_bin_dir

  cp ${startdir}/postal-git $_bin_dir
  cp bin/postal1-* $_data_dir
  ls bin/postal1-* | sed 's/bin/./g' >> ${_bin_dir}/postal-git
  cp DefaultPostal.ini $_data_dir/POSTAL.INI
}
