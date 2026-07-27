# Maintainer: Josef Zoller <josef@walterzollerpiano.com>
pkgname=zed-preview-bin
pkgver=1.13.1
pkgrel=1
pkgdesc="A high-performance, multiplayer code editor from the creators of Atom and Tree-sitter"
arch=('x86_64' 'aarch64')
url="https://zed.dev"
license=('GPL-3.0-or-later' 'AGPL-3.0-or-later' 'Apache-2.0')
depends=('alsa-lib' 'libasound.so'
         'curl' # 'libcurl.so'
         'fontconfig'
         'glibc' # 'libc.so' 'libm.so' 'libresolv.so'
         'libgcc' 'libgcc_s.so'
         # 'libgit2' 'libgit2.so'
         'libstdc++' 'libstdc++.so'
         # 'libxau' 'libXau.so'
         'libxcb' # 'libxcb.so' 'libxcb-xkb.so'
         # 'libxdmcp' 'libXdmcp.so'
         'libxkbcommon' # 'libxkbcommon.so'
         'libxkbcommon-x11' # 'libxkbcommon-x11.so'
         'nodejs>=18'
         'netcat'
         'npm'
         'openssl' # 'libcrypto.so' 'libssl.so'
         'sqlite'
         'vulkan-driver'
         'vulkan-icd-loader'
         'vulkan-tools'
         'wayland'
         'zlib' 'libz.so'
         'zstd' # 'libzstd.so'
)
optdepends=('clang: improved C/C++ language support'
            'eslint: improved Javascript language support'
            'pyright: improved Python language support'
            'rust-analyzer: improved Rust language support'
            'org.freedesktop.secrets: to keep you logged into your Zed account')
provides=("${pkgname%-preview-bin}=$pkgver")
conflicts=("${pkgname%-preview-bin}")
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/api/releases/preview/$pkgver/zed-linux-x86_64.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::$url/api/releases/preview/$pkgver/zed-linux-aarch64.tar.gz")
sha256sums_x86_64=('f615aaf65808b1ff3cae8253c1ce01d8abeef4f6c437f905d778f23c36f27425')
sha256sums_aarch64=('0442a801586fad52ce8a4b7ce2c9f34464fefd99986bfcddac43d8769599bd80')

package() {
    cd zed-preview.app

    desktop_file_path='share/applications/dev.zed.Zed-Preview.desktop'

    sed -i "s|Icon=zed|Icon=/usr/share/icons/${pkgname%-preview-bin}.png|g" "$desktop_file_path"
    sed -i "s|Exec=zed|Exec=/usr/bin/zeditor|g" "$desktop_file_path"

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
