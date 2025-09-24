pkgname=omazed
pkgver=1.0.0
pkgrel=1
pkgdesc="Live theme switching for Zed in Omarchy - automatically synchronize your Zed editor theme with your Omarchy system theme"
arch=('any')
url="https://github.com/aps6/omazed"
license=('MIT')
depends=('inotify-tools')
optdepends=('zed: Zed editor for theme switching')
makedepends=('git')
backup=()
install=omazed.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/aps6/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9c95a09b10b22aba38e771ab896e8a719ed262243c966a989f6cdd41198c71fb')

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
