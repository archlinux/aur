pkgname=macos-bigsur-sound-theme
pkgver=1.0.2
pkgrel=1
pkgdesc="macOS Big Sur sound theme for Linux (personal use only)"
arch=('any')
url="https://github.com/gxanshu/macos-bigsur-sound-theme-linux"
license=('LicenseRef-apple-restricted-sound')
options=('!strip')

source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
    'apple-restricted-sound'
)

sha256sums=('93d1ad6ceab354a571a21197aa1c5b0624cef21f5bf8c92f1596de64f67cc7d8'
            'f5267b41dc88d668228f63901db7ca67be26de883859dc3462ae297f675934dd')

package() {
    local source_dir="$srcdir/macos-bigsur-sound-theme-linux-$pkgver/theme/bigsur"
    local destination="$pkgdir/usr/share/sounds/bigsur"

    install -dm755 "$destination"

    install -Dm644 \
        "$source_dir/index.theme" \
        "$destination/index.theme"

    cp -a --no-preserve=ownership \
        "$source_dir/stereo" \
        "$destination/stereo"

    find "$destination" -type d -exec chmod 755 {} +
    find "$destination" -type f -exec chmod 644 {} +

    install -Dm644 \
        "$srcdir/apple-restricted-sound" \
        "$pkgdir/usr/share/licenses/$pkgname/apple-restricted-sound"
}
