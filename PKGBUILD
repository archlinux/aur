# Maintainer: Aru Sahni <aru@arusahni.net>
pkgname=autohide-tdrop-git
pkgver=1.02
pkgrel=2
epoch=
pkgdesc="100% pure rust implementation that can automatically hide terminals or other applications managed by tdrop when they lose focus"
arch=('x86_64')
url="https://github.com/I-Want-ToBelieve/autohide-tdrop/"
license=('MIT')
groups=()
depends=('git')
makedepends=('cargo')
checkdepends=()
optdepends=()
provides=('autohide-tdrop')
conflicts=('autohide-tdrop')
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname%}::git+http://github.com/I-Want-ToBelieve/autohide-tdrop.git")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

build() {
    cd "$pkgname"
    cargo build --release --locked
}

check() {
    cd "$pkgname"
    cargo test --locked
}

package() {
    cd "$pkgname"
    cargo install --root "${pkgdir}"/usr --path "${srcdir}/${pkgname}"
    # Random metadata file created by cargo. See https://github.com/rust-lang/cargo/issues/6797
    rm "${pkgdir}"/usr/.crates.toml "${pkgdir}"/usr/.crates2.json
}
