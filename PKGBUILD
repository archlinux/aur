# Maintainer:  Martin C. Doege <mdoege at compuserve dot com>
# Contributor: Anh Hai Trinh <anh.hai.trinh@gmail.com>
# Contributor: Christopher Arndt <chris@chrisarndt.de>

_pkgname=so-synth-lv2
pkgname="${_pkgname}-git"
pkgver=1.4.r174.e7ff3d5
pkgrel=1
epoch=1
pkgdesc="Unofficial LV2 ports of 50m30n3's synthesizers"
arch=(i686 x86_64)
url="https://github.com/jeremysalwen/So-synth-LV2"
license=('GPL3')
depends=('lv2')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/jeremysalwen/So-synth-LV2.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  ver=$(git tag -l | grep upstream | sort -rn | head -1 | cut -f 2 -d /)
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"

  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  make DESTDIR="$pkgdir" install
}

