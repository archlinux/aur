# Maintainer: KafCoppelia <k740677208 at gmail dot com>
# SPDX-License-Identifier: 0BSD

pkgname=quosparr-bin
pkgver=1.12.2
pkgrel=1
pkgdesc='Native desktop tray monitor for AI quotas, session usage and costs'
arch=('x86_64' 'aarch64')
url='https://github.com/Licoy/Quosparr'
license=('AGPL-3.0-only AND MIT AND LicenseRef-Remix-Icon')
depends=('ca-certificates' 'cairo' 'dbus' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme'
         'libayatana-appindicator' 'org.freedesktop.secrets' 'pango' 'ttf-font' 'xdg-utils')
provides=("quosparr=$pkgver")
conflicts=('quosparr')
options=('!strip' '!debug')

_tag_src="https://raw.githubusercontent.com/Licoy/Quosparr/v$pkgver"
source=("quosparr-$pkgver-LICENSE::$_tag_src/LICENSE"
        "quosparr-$pkgver-THIRD_PARTY_NOTICES.md::$_tag_src/THIRD_PARTY_NOTICES.md"
        "quosparr-$pkgver-LOBEHUB-LICENSE::$_tag_src/internal/app/assets/providers/LOBEHUB-LICENSE"
        "quosparr-$pkgver-REMIXICON-LICENSE::$_tag_src/internal/app/assets/providers/REMIXICON-LICENSE")
source_x86_64=("$url/releases/download/v$pkgver/quosparr-$pkgver-linux-amd64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/quosparr-$pkgver-linux-arm64.tar.gz")
sha256sums=('8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef'
            'ee9e9ad9120a759ea9194888b394977fc203f1946c62007f6317d2270b9448bb'
            'add9d7531d1b21646317a8958e38fc727506fa39d24bdecb44154d943c82753a'
            '6f2f21c5f8db34635d31848e9ff831d5dc421bb83ffc9d37f82651364047ae58')
sha256sums_x86_64=('330d303b85c8ccbfea54e536741e4f196d463d0380a8767b73772ebba9318d24')
sha256sums_aarch64=('f7dec92c773484dbc6ea8c6d52e42eaf0a7ae936c5d32f9650f0e7f380f55c5a')

package() {
    install -Dm755 quosparr libmygo-sqlite3.so -t "$pkgdir/usr/lib/quosparr/"
    install -d "$pkgdir/usr/bin"
    ln -s ../lib/quosparr/quosparr "$pkgdir/usr/bin/quosparr"
    install -Dm644 quosparr.desktop "$pkgdir/usr/share/applications/quosparr.desktop"
    install -Dm644 quosparr.png "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/quosparr.png"

    local notice
    for notice in LICENSE THIRD_PARTY_NOTICES.md LOBEHUB-LICENSE REMIXICON-LICENSE; do
        install -Dm644 "quosparr-$pkgver-$notice" "$pkgdir/usr/share/licenses/$pkgname/$notice"
    done
}
