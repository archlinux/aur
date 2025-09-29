

pkgname=uutils-tar-git
pkgver=0.0.1.g
pkgrel=1
pkgdesc="Rust implementation of tar"
arch=('x86_64')
url="https://github.com/uutils/tar"
license=('MIT')
depends=(gcc-libs)
makedepends=(rust)
source=("uutils-tar::git+${url}.git")
sha256sums=('SKIP')

#prepare(){
#  cd utils-tar
#  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
#}

build(){
  cd uutils-tar
  export RUSTFLAGS="-C codegen-units=$(( $(nproc) / 2 + 1 )) ${RUSTFLAGS}"
  cargo build --profile=release-fast
}

package() {
  cd uutils-tar
  install -Dvm755 target/release-fast/tarapp "$pkgdir"/usr/bin/uu-tar
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/uutils-tar
}
