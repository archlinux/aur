# Maintainer: Ossian Mapes <self@ossian.dev>

_pkgname=lutgen
pkgname=$_pkgname-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="A blazingly fast interpolated LUT generator and applicator for arbitrary and popular color palettes."
url="https://github.com/ozwaldorf/lutgen-rs"
license=("MIT")
arch=("x86_64")
provides=("lutgen")
conflicts=("lutgen")
source=("https://github.com/ozwaldorf/lutgen-rs/releases/download/v$pkgver/lutgen-$pkgver-x86_64.tar.gz")
sha256sums=("80487e6a291766921301f9184e1b73209b02ac7d0f94d93f9a240e5d40389b88")

package() { 
    mkdir -p completions/{bash,zsh,fish}
    ./lutgen --completions bash > completions/bash/$_pkgname 
    ./lutgen --completions zsh > completions/zsh/_$_pkgname
    ./lutgen --completions fish > completions/fish/$_pkgname.fish

    install -Dm755 lutgen -t "$pkgdir/usr/bin"
    install -Dm644 completions/bash/$_pkgname \
      -t "$pkgdir/usr/share/bash-completion/completions"
    install -Dm644 completions/zsh/_$_pkgname \
      -t "$pkgdir/usr/share/zsh/site-functions"
    install -Dm644 completions/fish/$_pkgname.fish \
      -t "$pkgdir/usr/share/fish/vendor_completions.d"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
