# Maintainer: Moritz Maxeiner <moritz@ucworks.org>

pkgname=dub-git
_gitname=dub
pkgver=0.9.21beta.1.565.d2d3e2c
pkgrel=1
pkgdesc="Package manager for D packages, git version"
arch=('i686' 'x86_64')
url="https://github.com/rejectedsoftware/dub"
license=('MIT')
depends=('dmd' 'curl')
makedepends=('git')
optdepends=()
source=()
conflicts=('dub')
source=('git://github.com/rejectedsoftware/dub.git')
md5sums=('SKIP')
sha256sums=('SKIP')

pkgver()
{
  cd ${srcdir}/${_gitname}
  echo $(git describe --abbrev=0 | sed 's|v||g' | sed 's|-||g').$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd ${srcdir}/${_gitname}
  ./build.sh
}

package() {
  cd ${srcdir}/${_gitname}
  install -D -m755 bin/dub "${pkgdir}/usr/bin/dub"
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
