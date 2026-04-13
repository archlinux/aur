# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=neovim-notify
pkgver=3.15.0
pkgrel=1
pkgdesc="Notification manager for Neovim"
arch=('any')
url="https://github.com/rcarriga/nvim-notify"
license=('MIT')
groups=('neovim-plugin')
checkdepends=('neovim-plenary')
install=notify.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ad57048040607728a57fcf4c6a4f6eb278a6b80d037edd537861ace784c80bff')

check() {
    cd "nvim-notify-$pkgver"
    ./scripts/test
}

package() {
    depends=('neovim')
    optdepends=('neovim-telescope')
    cd "nvim-notify-$pkgver"
    find doc lua \
        -type f \
        -exec install -Dm644 '{}' "$pkgdir/usr/share/nvim/site/pack/dist/start/$pkgname/{}" \;
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
