# Maintainer: Loic Coyle <loic.coyle@hotmail.fr>

_pkgname=tinty
pkgname="${_pkgname}-git"
pkgdesc='A base16 and base24 color scheme manager'
pkgver="r194.f00f1fa"
pkgrel=1
arch=('any')
url='https://github.com/tinted-theming/tinty'
license=('MIT')
depends=('git')
makedepends=('rust')
source=("${_pkgname}::git+https://github.com/tinted-theming/tinty.git")
md5sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    cargo build --release --locked
}

package() {
    cd "$_pkgname"
    install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    # completions
    install -Dm644 "contrib/completion/$_pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
    install -Dm644 "contrib/completion/$_pkgname.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"
    install -Dm644 "contrib/completion/$_pkgname.zsh" "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
}
