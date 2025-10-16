# Maintainer: Josef Zoller <josef@walterzollerpiano.com>
pkgname=zed-preview-bin
pkgver=0.209.1
pkgrel=1
pkgdesc="A high-performance, multiplayer code editor from the creators of Atom and Tree-sitter"
arch=('x86_64' 'aarch64')
url="https://zed.dev"
license=('GPL-3.0-or-later' 'AGPL-3.0-or-later' 'Apache-2.0')
depends=('alsa-lib' 'libasound.so'
         'fontconfig'
         'gcc-libs'
         'glibc'
         'libxcb'
         'libxkbcommon'
         'libxkbcommon-x11'
         'openssl' 'libssl.so'
         'sqlite'
         'vulkan-driver'
         'vulkan-icd-loader'
         'vulkan-tools'
         'wayland'
         'zlib' 'libz.so')
optdepends=('clang: improved C/C++ language support'
            'eslint: improved Javascript language support'
            'rust-analyzer: improved Rust language support')
provides=("${pkgname%-preview-bin}=$pkgver")
conflicts=("${pkgname%-preview-bin}")
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/api/releases/preview/$pkgver/zed-linux-x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::$url/api/releases/preview/$pkgver/zed-linux-aarch64.tar.gz")
sha256sums_x86_64=('8b03ceb5dce64a6072ba822899471b036fa2d9302e6259cf3c2349b374d58907')
sha256sums_aarch64=('68609155ce2af0af0f51118089cd9d836dc4be569e0888a554a54832168db551')

package() {
    cd zed-preview.app

    desktop_file_path='share/applications/zed-preview.desktop'

    sed -i "s|Icon=zed|Icon=/usr/share/icons/${pkgname%-preview-bin}.png|g" "$desktop_file_path"
    sed -i "s|Exec=zed|Exec=/usr/lib/zed/zed-editor|g" "$desktop_file_path"

    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/lib/zed"
    install -d "$pkgdir/usr/share/applications"
    install -d "$pkgdir/usr/share/licenses/${pkgname%-preview-bin}"
    install -d "$pkgdir/usr/share/icons"

    install -Dm755 "bin/zed" "$pkgdir/usr/bin/zeditor"
    install -Dm755 "libexec/zed-editor" "$pkgdir/usr/lib/zed/zed-editor"

    install -Dm644 "$desktop_file_path" "$pkgdir/usr/share/applications/dev.zed.Zed-Preview.desktop"

    install -Dm644 "licenses.md" "$pkgdir/usr/share/licenses/${pkgname%-preview-bin}/licenses.md"

    install -Dm644 "share/icons/hicolor/512x512/apps/zed.png" "$pkgdir/usr/share/icons/${pkgname%-preview-bin}.png"
}
