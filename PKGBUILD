# Maintainer: Hibryda <guess.crypto@proton.me>
#
# Binary package: installs the prebuilt static (musl) release binary. A
# from-source `gnfetch` package is not currently viable on Arch — ring 0.17.14's
# hand-written asm fails to link against current binutils — until gnfetch bumps
# its TLS stack to a newer ring.
pkgname=gnfetch-bin
_pkgname=gnfetch
pkgver=0.1.0
pkgrel=1
pkgdesc="A neofetch/fastfetch alternative that renders system info as a graphical card or ANSI"
arch=('x86_64' 'aarch64')
url="https://github.com/Hibryda/gnfetch"
license=('MIT')
provides=('gnfetch')
conflicts=('gnfetch')
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/gnfetch-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/gnfetch-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('165a1e5d7c0a0fc20cec9bcdf49050802f64f45d25ac8b93afa78e19e51a967c')
sha256sums_aarch64=('d4b3b775ce7fec302018f16547108632871264ea185cd645037c972995e5d50f')

package() {
    local _dir="$_pkgname-$pkgver-${CARCH}-unknown-linux-musl"
    install -Dm755 "$_dir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "$_dir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$_dir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
