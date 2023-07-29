# Maintainer: Ossian Mapes <self@ossian.dev>

_pkgname=lutgen
pkgname=$_pkgname-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="A blazingly fast interpolated LUT generator and applicator for arbitrary and popular color palettes."
url="https://github.com/ozwaldorf/lutgen-rs"
license=("MIT")
arch=("x86_64")
provides=("lutgen")
conflicts=("lutgen")
source=("https://github.com/ozwaldorf/lutgen-rs/releases/download/v$pkgver/lutgen-$pkgver-x86_64.tar.gz")
sha256sums=("30ad94a35fc6c201cf8eadd27af5a1ce0e062ec5ccf337a0125738b236c069a5")

package() { 
    mkdir completions
    ./lutgen completions bash > completions/$_pkgname 
    ./lutgen completions zsh > completions/_$_pkgname
    ./lutgen completions fish > completions/$_pkgname.fish

    install -Dm755 lutgen -t "$pkgdir/usr/bin"
    install -Dm644 completions/$_pkgname \
      -t "$pkgdir/usr/share/bash-completion/completions"
    install -Dm644 completions/_$_pkgname \
      -t "$pkgdir/usr/share/zsh/site-functions"
    install -Dm644 completions/$_pkgname.fish \
      -t "$pkgdir/usr/share/fish/vendor_completions.d"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
