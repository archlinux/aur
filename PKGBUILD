# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=lpm-git
_pkgname=lpm
_gitname=lite-xl-plugin-manager
pkgver=0.1.r17.g42b1f6d.3.g416d6f4
pkgrel=1
pkgdesc='A lite-xl plugin manager.'
arch=('x86_64' 'aarch64')
url="https://github.com/adamharrison/lite-xl-plugin-manager"
license=('MIT')
depends=('lite-xl' 'lua' 'zlib' 'libgit2' 'openssl' 'curl')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/adamharrison/lite-xl-plugin-manager")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --tags --long | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

build() {
  cd "${_gitname}"
  ./build.sh -lz -lssl -lgit2 -lcurl -llua -lcrypto
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp "${srcdir}/${_gitname}"/lpm "$pkgdir/usr/bin"
}
