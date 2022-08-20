# Maintainer: Popolon <popolon@popolon.org>
name=directfb2
pkgname=directfb2-git
pkgver=r85.c750bb98c
pkgrel=1
pkgdesc="An interface description language used by DirectFB"
arch=('x86_64')
url="https://github.com/directfb2/DirectFB2"
license=('GPL3')
groups=()
depends=('zlib')
makedepends=('git' 'meson' 'ninja' 'flux-git')
conflicts=()
replaces=()
backup=()
options=()
install=
source=("directfb2::git+${url}")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${name}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${name}"
  meson -Dmulti=true -Dprefix=/usr build/
  ninja -C build/
}

package() {
  cd "${srcdir}/${name}"
  DESTDIR=${pkgdir} ninja -C build/ install
}
