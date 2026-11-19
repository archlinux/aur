# Maintainer: KafCoppelia <k740677208 at gmail dot com>
# SPDX-License-Identifier: 0BSD

pkgname=quosparr-bin
pkgver=1.12.2
pkgrel=2
pkgdesc='Native desktop tray monitor for AI quotas, session usage and costs'
arch=('x86_64' 'aarch64')
url='https://github.com/Licoy/Quosparr'
license=('AGPL-3.0-only AND MIT AND LicenseRef-Remix-Icon')
depends=('ca-certificates' 'cairo' 'coreutils' 'dbus' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3'
         'hicolor-icon-theme' 'libayatana-appindicator' 'org.freedesktop.secrets' 'pango'
         'sh' 'util-linux' 'xdg-utils')
provides=("quosparr=$pkgver")
conflicts=('quosparr')
options=('!strip' '!debug')

_tag_src="https://raw.githubusercontent.com/Licoy/Quosparr/v$pkgver"
source=('quosparr-launcher'
        "quosparr-$pkgver-LICENSE::$_tag_src/LICENSE"
        "quosparr-$pkgver-THIRD_PARTY_NOTICES.md::$_tag_src/THIRD_PARTY_NOTICES.md"
        "quosparr-$pkgver-LOBEHUB-LICENSE::$_tag_src/internal/app/assets/providers/LOBEHUB-LICENSE"
        "quosparr-$pkgver-REMIXICON-LICENSE::$_tag_src/internal/app/assets/providers/REMIXICON-LICENSE"
        "quosparr-$pkgver-logo-256.png::$_tag_src/Resources/Brand/png/quosparr-logo-256.png"
        "quosparr-$pkgver-logo-512.png::$_tag_src/Resources/Brand/png/quosparr-logo-512.png")
source_x86_64=("$url/releases/download/v$pkgver/quosparr-$pkgver-linux-amd64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/quosparr-$pkgver-linux-arm64.tar.gz")
sha256sums=('d2c535ac87269936489c905af000254cd08025010c6d9ea7dba7a7990b9b6a61'
            '8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef'
            'ee9e9ad9120a759ea9194888b394977fc203f1946c62007f6317d2270b9448bb'
            'add9d7531d1b21646317a8958e38fc727506fa39d24bdecb44154d943c82753a'
            '6f2f21c5f8db34635d31848e9ff831d5dc421bb83ffc9d37f82651364047ae58'
            '2a01584463645eae170d2baceaba17c97912d4249bf511bbebd193a2ecd53e7f'
            '3eecfd3f22fa4b71e4043b5575c26818372489e97963c037a57c20fc4dead602')
sha256sums_x86_64=('330d303b85c8ccbfea54e536741e4f196d463d0380a8767b73772ebba9318d24')
sha256sums_aarch64=('f7dec92c773484dbc6ea8c6d52e42eaf0a7ae936c5d32f9650f0e7f380f55c5a')

package() {
    install -Dm755 quosparr libmygo-sqlite3.so -t "$pkgdir/usr/lib/quosparr/"
    install -Dm755 "$srcdir/quosparr-launcher" "$pkgdir/usr/bin/quosparr"
    install -Dm644 quosparr.desktop "$pkgdir/usr/share/applications/quosparr.desktop"
    install -Dm644 "quosparr-$pkgver-logo-256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/quosparr.png"
    install -Dm644 "quosparr-$pkgver-logo-512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/quosparr.png"

    local notice
    for notice in LICENSE THIRD_PARTY_NOTICES.md LOBEHUB-LICENSE REMIXICON-LICENSE; do
        install -Dm644 "quosparr-$pkgver-$notice" "$pkgdir/usr/share/licenses/$pkgname/$notice"
    done
}
