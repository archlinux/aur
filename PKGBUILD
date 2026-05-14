# Maintainer: Pasqual Troncone <pasqualtroncone at gmail dot com>

pkgname=ai-jail-bin
_pkgname=ai-jail
pkgver=0.10.3
pkgrel=1
pkgdesc='Sandbox for AI coding agents (bubblewrap on Linux, sandbox-exec on macOS) — prebuilt binary'
arch=('x86_64')
url='https://github.com/akitaonrails/ai-jail'
license=('GPL-3.0-only')
# Upstream ships the binary fully stripped (no .symtab, no
# .debug_*). Skipping strip + debug split keeps the installed
# binary byte-for-byte identical to the release asset, so users
# can verify it against the sha256 upstream publishes.
options=('!strip' '!debug')
depends=('bubblewrap' 'glibc' 'gcc-libs')
optdepends=(
    'mise: language version management inside the sandbox'
    'docker: Docker socket passthrough'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/akitaonrails/ai-jail/releases/download/v$pkgver/ai-jail-linux-$CARCH.tar.gz"
    "LICENSE-$pkgver::https://raw.githubusercontent.com/akitaonrails/ai-jail/v$pkgver/LICENSE"
)
sha256sums=(
    '78976db421347fdedd7f6a57bd7da6e87de879f36dd7e8aa7750fae90703986e'
    '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
)

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$_pkgname"
    install -Dm0644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
