# Maintainer: Angelo Verlain <hey@vixalien.com>

pkgname=supabase-bin
pkgver=1.136.3
pkgrel=1
pkgdesc="A CLI for Supabase, an open source Firebase alternative"
url="https://github.com/supabase/cli"
license=("MIT")
arch=("x86_64")
provides=("supabase")
conflicts=("supabase")
source=("$pkgname-$pkgver.tar.gz::https://github.com/supabase/cli/releases/download/v$pkgver/supabase_linux_amd64.tar.gz")
sha256sums=('74768bd761b3ff53c76101cb0dbb968378004fd94890e7ae1bce8663482cf55a')
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
