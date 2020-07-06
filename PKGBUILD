# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=nimsynth-git
_pkgname=nimsynth
pkgver=r150.4985e4c
pkgrel=1
pkgdesc="A modular synth and sequencer made with Nim"
arch=('x86_64')
url='https://github.com/ftsf/nimsynth'
license=('GPL3')
provides=('nimsynth')
depends=('glibc')
makedepends=('git' 'nim' 'nimble')
source=("nimsynth::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  git checkout nim1.2
  nimble -y install sndfile nico
  make
}

package() {
  cd "${_pkgname}"
  install -Dm755 synth "${pkgdir}/usr/bin/${_pkgname}"
}