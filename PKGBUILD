pkgname=syk-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="Search folder names, file names and file contents in one pass"
arch=('x86_64' 'aarch64')
url="https://github.com/remcostoeten/syk"
license=('MIT')
depends=('glibc' 'libgcc')
provides=('syk')
conflicts=('syk')
options=('!debug' '!strip')
source_x86_64=("syk-$pkgver-x86_64.tar.xz::$url/releases/download/v$pkgver/syk-search-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("syk-$pkgver-aarch64.tar.xz::$url/releases/download/v$pkgver/syk-search-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('62b57de550c2a9383fba6783a1ba5ce27ca6d0c492f4e6fdcfc22747258f7404')
sha256sums_aarch64=('6b9db712355abe9e71c3c58947ecaec16a4c27ead4f1afa5e5a66b8ae331da93')

package() {
    cd "syk-search-$CARCH-unknown-linux-gnu"
    install -Dm755 syk "$pkgdir/usr/bin/syk"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    if ./syk --init man > syk.1; then
        install -Dm644 syk.1 "$pkgdir/usr/share/man/man1/syk.1"
        ./syk --init fish: | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/syk.fish"
        ./syk --init zsh: | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_syk"
        ./syk --init bash: | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/syk"
    fi
}
