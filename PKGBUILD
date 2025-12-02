# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-orgmode-git
_pkgname="${pkgname%-git}"
pkgver=0.7.1.r30.gb525c775
pkgrel=1
pkgdesc="Orgmode clone for Neovim"
arch=('any')
url="https://github.com/kristijanhusak/orgmode.nvim"
license=('MIT')
groups=('neovim-plugins')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
install=orgmode.install
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
    git -C "$pkgname" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
    depends=('neovim')
    cd "$pkgname"
    dirs=(doc ftplugin indent lua queries syntax)
    find "${dirs[@]}" -type f -exec install -Dvm644 '{}' "$pkgdir/usr/share/nvim/site/pack/dist/start/$pkgname/{}" \;
    install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
