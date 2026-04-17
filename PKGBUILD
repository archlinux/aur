# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Atte Lautanala <atte@lautana.la>

pkgname=neovim-auto-session-git
pkgver=2.5.1.r198.g6243753
pkgrel=1
pkgdesc="Small automated session manager"
arch=('any')
url="https://github.com/rmagatti/auto-session"
license=('MIT')
groups=('neovim-plugin')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=auto-session.install
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
    git -C "$pkgname" describe --long --tags --match "v[0-9].*" | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
    depends=('neovim')
    cd "$pkgname"
    find doc lua -type f -exec \
        install -Dm644 '{}' "$pkgdir/usr/share/nvim/site/pack/dist/start/$pkgname/{}" \;
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
