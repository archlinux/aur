# Maintainer: Gabriel Oliveira da Silva <glcbofs@proton.me>
pkgname=gittorrent
pkgver=3.1.7
pkgrel=1
pkgdesc="a CLI version control system with a CI/CD pipeline"
arch=("x86_64")
url="https://projectgrid.net/portfolio/gittorrent"
license=("0BSD")
makedepends=("cargo")
optdepends=("bash-completion: for command line completions when pressing the <tab> key")
install="advice.install"
source=("${pkgname}-${pkgver}.tar.xz::https://projectgrid.net/archive/${pkgname}-${pkgver}.tar.xz")

sha256sums=('90c18b34ff687edf86db7805d41694251ddab8fbfa70a845c54710664828bae3')

prepare()
{
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target $(rustc --print host-tuple)
}

build()
{
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package()
{
  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/$pkgname"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
