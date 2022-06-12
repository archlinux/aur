# Maintainer: Daniel Mita <daniel@dango.space>
# Contributor:

pkgname=rakuenv-git
pkgver=1.1.1.r27.d08f6ad
pkgrel=1
pkgdesc='Raku Environment Manager'
arch=('any')
url='https://github.com/skaji/rakuenv'
license=('MIT')
depends=('bash')
makedepends=('git')
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    printf "1.1.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${pkgname%-git}"

    install -Dm 644 ./LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

    # mkdir -p "$pkgdir/usr/lib/rakuenv/completions/"
    install -Dm 644 -t "$pkgdir/usr/lib/rakuenv/completions/" ./completions/*

    # mkdir -p "$pkgdir/usr/lib/rakuenv/libexec/"
    install -Dm 755 -t "$pkgdir/usr/lib/rakuenv/libexec/" ./libexec/*

    install -d "$pkgdir/usr/bin/"
    ln -s /usr/lib/rakuenv/libexec/rakuenv "$pkgdir/usr/bin/"
}
