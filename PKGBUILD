# Maintainer: xsmile <>
pkgname=ifrextractor-ls-git
_pkgname=ifrextractor-ls
pkgver=r37.4f9699d
pkgrel=1
pkgdesc='Utility that can extract the internal forms represenation from both EFI and UEFI modules'
arch=('any')
url='https://github.com/LongSoft/Universal-IFR-Extractor'
license=('GPL3')
makedepends=('cmake' 'git')
provides=('ifrextractor')
conflicts=('ifrextractor')
source=("${_pkgname}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  mkdir build
  cd build
  cmake ..
}

build() {
  cd "$_pkgname"
  cd build
  make
}

package() {
  cd "$_pkgname/build"
  local binname=ifrextract
  install -D -m755 "$binname" "${pkgdir}/usr/bin/${binname}"
}
