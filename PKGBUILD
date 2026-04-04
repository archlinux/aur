# Maintainer: myueqf myueqf@gmail.com
pkgname=claude-launch
pkgver=26w14a
pkgrel=1
pkgdesc="Claude Code CLI proxy tool that converts Anthropic API requests to OpenAI API format"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/myueqf/claude-launch"
license=('Apache-2.0')
options=('!debug')
depends=()
optdepends=('claude-code: Claude Code CLI to use with this proxy')
makedepends=('git' 'go>=1.26')
source=("$pkgname::git+https://github.com/myueqf/claude-launch.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "%s.r%s.g%s" "QAQ" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$pkgname"
}

build() {
    cd "$srcdir/$pkgname"
    go build -o "$pkgname" .
}

package() {
    cd "$srcdir/$pkgname"

    # Install binary
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install README
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
