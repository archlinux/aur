# Maintainer: Matilde Morrone <aur at morrone dot dev>

pkgname=piri-git
pkgver=r16.5edf260
pkgrel=1
pkgdesc="A simple program to make the firefox pip persist across workspaces in niri"
arch=('x86_64' 'aarch64')
url="https://github.com/morr0ne/piri"
license=('EUPL-1.2')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'just' 'git' 'clang' 'lld')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/morr0ne/piri.git')
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname%-git}"
    just build
}

package() {
    cd "${pkgname%-git}"
    just install "$pkgdir" "/usr"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}
