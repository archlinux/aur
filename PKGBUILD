# Maintainer: nazze <nazze at qq dot com>
# SPDX-License-Identifier: 0BSD
pkgname=agentero-bin
pkgver=0.18.2
pkgrel=1
pkgdesc='Local-first research workspace (official desktop binary)'
arch=('x86_64')
url='https://github.com/poco-ai/Agentero'
license=('MIT')
depends=('glibc' 'gcc-libs' 'gtk3' 'webkit2gtk-4.1' 'glib2' 'cairo' 'gdk-pixbuf2' 'dbus' 'libsoup3')
optdepends=('nodejs: run Node-based agent adapters' 'openssh: remote agent connections')
provides=("agentero=$pkgver")
conflicts=('agentero')
options=('!strip' '!debug')
source=("$url/releases/download/v$pkgver/Agentero_${pkgver}_amd64.deb"
        "LICENSE-$pkgver::$url/raw/refs/tags/v$pkgver/LICENSE")
sha256sums=('93711d2d9d300803bc436b11b13acdb360d0e018cd18e269965d4da6a1cd73f8'
            'f2b7f0cc6fb11f63654ac171d46640de6a8f63407a1a9fa77181a5c43a841fcf')

package() {
    # Retain Tauri's resource paths, plugin sidecar and upstream desktop entry.
    bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir" usr
    install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
