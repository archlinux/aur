# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=fish-exa-git
pkgver=r26.92e5bcb
pkgrel=1
pkgdesc="exa aliases for fish"
arch=('any')
url="https://github.com/gazorby/fish-exa"
license=('MIT')
groups=('fish-plugins')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=fish-exa.install
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    depends=('fish' 'exa')
    cd "$pkgname"
    install -Dvm644 conf.d/* -t "$pkgdir/usr/share/fish/vendor_conf.d/"
    install -Dvm644 functions/* -t "$pkgdir/usr/share/fish/vendor_functions.d/"
    install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dvm644 README.md -t "$pkgdir/usr/share/docs/$pkgname/"
}
