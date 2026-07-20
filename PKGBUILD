# Maintainer: hedgeg0d <werstak192@gmail.com>
pkgname=zlang-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="ZLang programming language compiler (pre-built AppImage)"
arch=('x86_64' 'aarch64')
url="https://github.com/zlangdevs/zlang"
license=('GPL-3.0-only')
provides=('zlang')
conflicts=('zlang' 'zlang-git')
options=('!strip')
source_x86_64=("zlang-x86_64.AppImage::https://github.com/zlangdevs/zlang/releases/download/v$pkgver/zlang-x86_64.AppImage")
source_aarch64=("zlang-aarch64.AppImage::https://github.com/zlangdevs/zlang/releases/download/v$pkgver/zlang-aarch64.AppImage")
sha256sums_x86_64=('a8c9909344ea4e145a7ccc09c8b046716d53a305089c934ef0d8f2a2b6288a49')
sha256sums_aarch64=('824e5845ce604861f4f4104cb2acf314e3dbdd1ac546e041f7e9bcb0e3551a0c')

package() {
    install -Dm755 "zlang-$CARCH.AppImage" "$pkgdir/usr/lib/zlang-bin/zlang.AppImage"

    install -dm755 "$pkgdir/usr/bin"
    # Wrapper uses APPIMAGE_EXTRACT_AND_RUN so FUSE is not required
    cat > "$pkgdir/usr/bin/zlang" << 'WRAPPER'
#!/bin/sh
exec env APPIMAGE_EXTRACT_AND_RUN=1 /usr/lib/zlang-bin/zlang.AppImage "$@"
WRAPPER
    chmod 755 "$pkgdir/usr/bin/zlang"

    install -Dm644 /dev/null "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
