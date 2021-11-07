# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=cue2pops-git
pkgver=r82.541863a
pkgrel=1
pkgdesc="Convert Playstation Games To VCD for Popstarter (GIT version)"
arch=('x86_64')
url='https://github.com/makefu/cue2pops-linux'
license=('GPL2')
depends=('glibc')
makedepends=('make')
provides=('cue2pops')
conflicts=('cue2pops')
source=('cue2pops::git+https://github.com/makefu/cue2pops-linux.git')
sha256sums=('SKIP')

pkgver() {
  cd cue2pops
#   echo "$(git describe --long --tags | tr - . | tr -d v)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd cue2pops
  make CFLAGS="-Wall -Wextra ${CFLAGS} ${LDFLAGS}"
}

package() {
  cd cue2pops
  install -d "${pkgdir}/usr/bin"
  make INSTALL_DIR="${pkgdir}/usr/bin" install

  install -Dm644 README.TXT "${pkgdir}/usr/share/doc/${pkgname}/README.TXT"
}

