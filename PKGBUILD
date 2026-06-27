# Maintainer: Lukas Grumlik (Rakosn1cek) <rakosn1cek@zohomail.eu>
pkgname=oversight-git
_srcname=oversight
pkgver=0.5.6
pkgrel=2
pkgdesc="Security Intelligence & Static Audit Engine for local scripts and raw web links"
arch=('x86_64')
url="https://github.com/Rakosn1cek/oversight"
license=('MIT')
depends=('openssl')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Rakosn1cek/oversight/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "${_srcname}-${pkgver}"
  export CARGO_HOME="${srcdir}/cargo-home"
  
  cargo fetch
}

build() {
  cd "${_srcname}-${pkgver}"
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo build --frozen --release --all-features
}

package() {
  cd "${_srcname}-${pkgver}"
  
  install -Dm755 "target/release/oversight" "${pkgdir}/usr/bin/${pkgname}"
  
  install -Dm644 "rules.json" "${pkgdir}/usr/share/oversight/rules.json"
  
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
 
  install -Dm644 "oversight.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm644 "oversight.zsh"  "${pkgdir}/usr/share/zsh/site-functions/oversight"
  install -Dm644 "oversight.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
}
