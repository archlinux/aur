# Maintainer: Gabriel Oliveira da Silva <glcbofs@proton.me>
pkgname=gittorrent
pkgver=3.0.1
pkgrel=1
pkgdesc="a CLI version control system with a CI/CD pipeline"
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
source=(
  "git+https://git.projectgrid.net/gittorrent.git"
  "LICENSE"
)
sha256sums=(
  "SKIP"
  "7056c04df17a4e0f0bac9f787f347c9cd892cee6323d1c89528090afd0b934a3"
)

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
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
