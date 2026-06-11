# Maintainer: Jakov Petrina <jkv.petrina@gmail.com>

pkgname=mboxshell-git
pkgver=0.4.7.r0.g68a4d1e
pkgrel=1
pkgdesc="Fast terminal viewer for MBOX files of any size without loading them into memory"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/dcarrero/mboxshell"
license=(MIT)
depends=()
provides=(mboxshell)
conflicts=(mboxshell)
makedepends=('git' 'cargo')
source=("git+https://github.com/dcarrero/mboxshell.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/mboxshell"

  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/mboxshell"

  if [[ $CARCH != x86_64 ]]; then
    export CARGO_PROFILE_RELEASE_LTO=off
  fi

  cargo build --release --locked
}

package() {
  cd "${srcdir}/mboxshell"

  install -Dm755 "target/release/mboxshell" -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
