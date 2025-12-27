# Maintainer: Gabriel Oliveira da Silva <glcbofs@proton.me>
pkgname=gittorrent
pkgver=1.0.0
pkgrel=1
pkgdesc="a lightweight, encrypting version control system with a CI/CD pipeline"
arch=("x86_64")
url="https://projectgrid.net/portfolio/gittorrent"
license=("0BSD")
makedepends=(
  "git"
  "cargo"
)
optdepends=(
  "bash-completion: for command line completions when pressing the <tab> key"
)
install="advice.install"
source=("git+https://git.projectgrid.net/git/gittorrent.git")
sha256sums=('SKIP')

prepare()
{
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target $(rustc --print host-tuple)
}

build()
{
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package()
{
  cd "$pkgname"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
