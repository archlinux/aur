pkgname=rlshim-git
pkgver=1.5.0
pkgrel=1
pkgdesc="A lightweight, native Linux launcher for RuneLite. (Git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/RdrSeraphim/rlshim"
license=('BSD-2-Clause')
depends=('libsecret' 'gcc-libs' 'glibc' 'java-runtime>=11')
makedepends=('cargo' 'git' 'make' 'pkgconf' 'curl')
provides=('rlshim')
conflicts=('rlshim')
source=("git+https://github.com/RdrSeraphim/rlshim.git")
sha256sums=('SKIP')

pkgver() {
  cd rlshim
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd rlshim
    cargo build --release --locked
}

package() {
    cd rlshim
    DESTDIR="$pkgdir" PREFIX=/usr make install
}
