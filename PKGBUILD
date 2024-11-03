# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>
pkgname=c2t-git
_pkgname=c2t
pkgver=r119.6c20c17
pkgrel=1
pkgdesc="Apple II audio file cassette utility"
arch=('x86_64')
url="https://github.com/datajerk/c2t"
license=('custom')
depends=()
makedepends=(tinyxxd)
source=(
  git+https://github.com/datajerk/c2t.git
  c2t-use-system-cc65.patch
)
sha256sums=('SKIP'
            '4d5cfd5610e5c87d37f778e44d96cde0e60664c6d2762e6e5cffbe407145ab2f')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  # fails, must use bundled cc65
#  patch -Np1 < "${srcdir}/c2t-use-system-cc65.patch"
}

build() {
  cd "${srcdir}/${_pkgname}"
  # remove binary artifacts checked in
  make clean
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm775 bin/c2t "$pkgdir"/usr/bin/c2t
  install -Dm775 bin/c2t-96h "$pkgdir"/usr/bin/c2t-96h
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
  # should we really put the monitor code into share?
}
