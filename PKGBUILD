# Maintainer: Aru Sahni <aru@arusahni.net>
pkgname=git-req
pkgver=2.3.0
pkgrel=1
epoch=
pkgdesc="Switch between merge/pull requests in your GitLab and GitHub repositories with just the request ID."
arch=('x86_64')
url="https://arusahni.github.io/git-req/"
license=('MIT')
groups=()
depends=('git')
makedepends=('cargo')
checkdepends=()
optdepends=()
provides=('git-req')
conflicts=('git-req')
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/arusahni/$pkgname/archive/v$pkgver.tar.gz")
noextract=()
sha256sums=('e963f45677e459d62ea6e3e6e42190aa5cb2a54719034699cab75e86d1316499')
validpgpkeys=()

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --locked
}

package() {
    cd "$pkgname-$pkgver"
    cargo install --root "${pkgdir}"/usr --path "${srcdir}/${pkgname}-${pkgver}"
    install -D -m644 "${srcdir}/${pkgname}-${pkgver}/target/release/${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
    # Random metadata file created by cargo. See https://github.com/rust-lang/cargo/issues/6797
    rm "${pkgdir}"/usr/.crates.toml
}
