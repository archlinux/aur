pkgname=showel
pkgver=0.2.2.3
pkgrel=1
pkgdesc="Fast native desktop database client built with Rust and Dioxus"
arch=('x86_64')
url="https://github.com/Fynth/Showel"
license=('unknown')
depends=(
  'gtk3'
  'webkit2gtk-4.1'
  'xdotool'
)
makedepends=(
  'pkgconf'
  'rust'
)
conflicts=('showel-git')
options=('!debug' '!lto')
_sourcedir="Showel-0.2.2.3"
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/Fynth/Showel/archive/refs/tags/v0.2.2.3.tar.gz"
)
sha256sums=(
  '6858e9c746ca0662022e1423dd146bbcf2ece0e1efbf9a3adf4f2a1d03cad74b'
)

prepare() {
  cd "${srcdir}/${_sourcedir}"

  export CARGO_HOME="${srcdir}/cargo-home"
  cargo fetch --locked
}

build() {
  cd "${srcdir}/${_sourcedir}"

  export CARGO_HOME="${srcdir}/cargo-home"
  export CARGO_TARGET_DIR="${srcdir}/target"

  cargo build --frozen --release -p app --features desktop
}

package() {
  cd "${srcdir}/${_sourcedir}"

  install -Dm755 "${srcdir}/target/release/app" "${pkgdir}/usr/bin/showel"
  install -Dm644 "app/assets/app.css" "${pkgdir}/usr/lib/showel/assets/app.css"
  install -Dm644 "packaging/arch/showel.desktop" "${pkgdir}/usr/share/applications/showel.desktop"
  install -Dm644 "app/assets/icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/showel.svg"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/showel/README.md"
}
