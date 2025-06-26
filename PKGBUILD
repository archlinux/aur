# Maintainer: Ossian Mapes <self@ossian.dev>

_pkgname=lutgen
pkgname=$_pkgname-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="A blazingly fast interpolated LUT utility for arbitrary and popular color palettes."
url="https://github.com/ozwaldorf/lutgen-rs"
license=("MIT")
arch=("x86_64")
provides=("lutgen")
conflicts=("lutgen")
source=("LICENSE" "https://github.com/ozwaldorf/lutgen-rs/releases/download/lutgen-v$pkgver/lutgen-cli-v$pkgver-x86_64-unknown-linux-gnu")
sha256sums=('f007afaeba32931337b4be155b3f8094cce9248dece43ebe53bf2579fe26a330'
            'd744cd4bb6033e252cff8918417f60825d080f2f24fade1fd42a1eed8be96b81')

package() {
    mv lutgen-cli-v$pkgver-x86_64-unknown-linux-gnu lutgen
    install -Dm755 lutgen -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    chmod +x lutgen
    mkdir completions
    ./lutgen --bpaf-complete-style-bash > completions/$_pkgname
    ./lutgen --bpaf-complete-style-zsh > completions/_$_pkgname
    ./lutgen --bpaf-complete-style-fish > completions/$_pkgname.fish
    install -Dm644 completions/$_pkgname -t \"$pkgdir/usr/share/bash-completion/completions\"
    install -Dm644 completions/_$_pkgname -t \"$pkgdir/usr/share/zsh/site-functions\"
    install -Dm644 completions/$_pkgname.fish -t \"$pkgdir/usr/share/fish/vendor_completions.d\"
}


