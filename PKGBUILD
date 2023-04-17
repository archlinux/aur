# Maintainer: Angelo Verlain <hey@vixalien.com>

pkgname=supabase-bin
pkgver=1.50.6
pkgrel=1
pkgdesc="A CLI for Supabase, an open source Firebase alternative"
url="https://github.com/supabase/cli"
license=("MIT")
arch=("x86_64")
provides=("supabase")
conflicts=("supabase")
source=("$pkgname-$pkgver.tar.gz::https://github.com/supabase/cli/releases/download/v$pkgver/supabase_linux_amd64.tar.gz")
sha256sums=("769697452b04253fb3dd5a19cb8933b70cf480920039875b71ba6c5d65be9fb5")
optdepends=(
    'bash-completion: for shell auto-completion'
    'zsh-completions: for shell auto-completion'
)

build() {
    ./supabase completion bash > bash.completions
    ./supabase completion zsh > zsh.completions
    ./supabase completion fish > fish.completions
}

package() {
    install -Dm755 supabase -t "$pkgdir/usr/bin"

    install -Dm644 bash.completions "$pkgdir/usr/share/bash-completion/completions/supabase"
    install -Dm644 zsh.completions "$pkgdir/usr/share/zsh/site-functions/_supabase"
    install -Dm644 fish.completions "$pkgdir/usr/share/fish/vendor_completions.d/supabase.fish"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
