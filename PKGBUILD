# Maintainer: Lukas Grumlik (Rakosn1cek) <rakosn1cek@zohomail.eu>
pkgname=oversight-git
pkgver=0.5.6
pkgrel=2
pkgdesc="Security Intelligence & Static Audit Engine for local scripts and raw web links"
arch=("x86_64")
url="https://github.com/Rakosn1cek/oversight"
license=("MIT")
depends=("openssl")
makedepends=("cargo")
source=("https://github.com/Rakosn1cek/oversight/archive/v${pkgver}.tar.gz")
sha256sums=('3d61b9b215c453f32fc0ab4c7135228f7a98edec756183ffe3b1fec2ed9272d7')

srcname="oversight-${pkgver}"

prepare() {
  cd "${srcname}"
  export CARGO_HOME="${srcdir}/cargo-home"
  
  cargo fetch
}

build() {
  cd "${srcname}"
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo build --frozen --release --all-features
}

package() {
  cd "${srcname}"
  
  install -Dm755 "target/release/oversight" "${pkgdir}/usr/bin/oversight"
  
  install -Dm644 "rules.json" "${pkgdir}/usr/share/oversight/rules.json"
  
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  install -Dm644 "oversight.bash" "${pkgdir}/usr/share/bash-completion/completions/oversight"
  install -Dm644 "oversight.zsh"  "${pkgdir}/usr/share/zsh/site-functions/oversight"
  install -Dm644 "oversight.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/oversight.fish"
}
