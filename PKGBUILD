# Maintainer: Loic Coyle <loic.coyle@hotmail.fr>

_pkgname=phomo
pkgname=${_pkgname}-git
pkgdesc='CLI utility to make photo mosaics'
pkgver="r111.69664eb"
pkgrel=1
arch=('any')
url='https://github.com/loiccoyle/phomo-rs'
license=('MIT')
depends=('git')
makedepends=('rust')
source=("${_pkgname}::git+https://github.com/loiccoyle/phomo-rs.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    cargo build --release --locked --bin phomo
}

package() {
    cd "$_pkgname"
    install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    # completions
    cd "${_pkgname}-cli"
    install -Dm644 "completions/$_pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
    install -Dm644 "completions/$_pkgname.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"
    install -Dm644 "completions/_$_pkgname" "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
}
