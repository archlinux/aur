# Maintainer: Eli W. Hunter <elihunter173@gmail.com>

# This PKGBUILD is maintained on github:
# https://github.com/elihunter173/aur-hercules-git

pkgname=hercules-analysis-git
pkgver=10.7.2.r4.g13a2081
pkgrel=1
depends=('go' 'protobuf')
makedepends=('make' 'git')
pkgdesc='Gaining advanced insights from Git repository history.'
arch=('any')
license=('Apache')
source=('git+https://github.com/src-d/hercules.git')
sha256sums=('SKIP')
url='https://github.com/src-d/hercules'

pkgver() {
  cd "${srcdir}/hercules"
  git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/hercules"
  mkdir -p "${srcdir}/go"
  GOPATH="${srcdir}/go" make
}

package() {
  cd "${srcdir}/hercules"
  install -Dm755 hercules "${pkgdir}/usr/bin/hercules"
}
