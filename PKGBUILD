# Maintainer: LuciKritZ <krishals.001@gmail.com>
pkgname=v2g
pkgver=1.0.0
pkgrel=1
pkgdesc="Video to optimized GIF converter using ffmpeg and gifsicle"
arch=('any')
url="https://github.com/LuciKritZ/v2g-tool"
license=('MIT')
depends=('bash' 'ffmpeg' 'gifsicle')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9a502570221f5f5c2e8b50790ee8c36f0e9680587715ae8305275cf0c1183f4b')

package() {
    cd "$pkgname-tool-$pkgver"

    # Install the executable wrapper
    install -Dm755 "bin/v2g" "$pkgdir/usr/bin/v2g"

    # Install the library to Arch's standard /usr/share directory
    install -Dm644 "lib/v2g.sh" "$pkgdir/usr/share/v2g/v2g.sh"

    # PATCH THE PATH: 
    # This replaces the hardcoded /usr/local/lib path with the /usr/share path
    # so the script works perfectly on Arch Linux.
    sed -i 's|/usr/local/lib/v2g/v2g.sh|/usr/share/v2g/v2g.sh|g' "$pkgdir/usr/bin/v2g"
}
