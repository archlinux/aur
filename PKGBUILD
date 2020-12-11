# Maintainer: Avery Murray <averylapine@gmail.com>

pkgname=proton-caller-git
pkgver=1.3.2.r10.g3b2fc50
pkgrel=1
pkgdesc="Run any Windows program through Proton"
arch=('x86_64')
url="https://github.com/caverym/Proton-Caller/"
license=('GPL3')
depends=(
  'steam'
  'dxvk'
)
makedepends=('git')
provides=(proton-caller)
conflicts=(proton-caller)

source=("git+https://github.com/caverym/Proton-Caller.git")
sha256sums=('SKIP')

pkgver() {
  cd Proton-Caller
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd Proton-Caller
  make
}

package() {
  cd Proton-Caller
  install -Dm755 proton-call "$pkgdir"/usr/bin/proton-call
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 manual/proton-call.6 "$pkgdir"/usr/share/man/man6/proton-call.6
}
