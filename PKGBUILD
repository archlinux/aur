pkgname=omazed
pkgver=1.1.2
pkgrel=1
pkgdesc="Live theme switching for Zed in Omarchy - automatically synchronize your Zed editor theme with your Omarchy system theme"
arch=('any')
url="https://github.com/aps6/omazed"
license=('MIT')
depends=('bash')
optdepends=('inotify-tools: for systemd watcher fallback (only needed if omarchy hook system is not available)')
makedepends=('git')
backup=()
install=omazed.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/aps6/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('dde23ab2b63040ca33928f2aef8d142801f3a3195a059011e185c4fb3fd5f0ce')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Install main scripts
    install -Dm755 omazed "$pkgdir/usr/bin/omazed"
    install -Dm755 omazed-converter.sh "$pkgdir/usr/bin/omazed-converter.sh"

    # Install systemd user service
    install -Dm644 omazed.service.aur "$pkgdir/usr/lib/systemd/user/omazed.service"

    # Install themes
    install -dm755 "$pkgdir/usr/share/omazed/themes"
    install -Dm644 themes/*.json "$pkgdir/usr/share/omazed/themes/"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
