# Maintainer: jerry73204 <jerry73204@gmail.com>
pkgname=tirex-git
pkgver=r222.a0c8d0d
pkgrel=1
pkgdesc="Tirex tile queue manager. A drop-in replacement for renderd."
arch=('i686' 'x86_64')
url='https://github.com/geofabrik/tirex'
license=('GPL2')
groups=()
depends=(
  # official packages
  'mapnik' 'perl-json' 'perl-gd' 'perl-libwww'
  # AUR packages
  'perl-ipc-sharelite'
)
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
options=()
source=("${pkgname%-VCS}"::'git+https://github.com/geofabrik/Tirex.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-VCS}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-VCS}"
  make
}

package() {
  cd "$srcdir/${pkgname%-VCS}"
  make DESTDIR="$pkgdir/" install-all
}
