# Maintainer: Stanko K.R. <stanko@stanko.io>
# Template for the AUR -bin package. `make release-aur` fills in the
# @PLACEHOLDER@ values and pushes the result to the AUR.
pkgname=okuri-bin
_binname=okuri
pkgver=0.2.0
pkgrel=1
pkgdesc="Dead-simple file transfer for Omarchy & Linux (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/monorkin/okuri"
license=('MIT')
# A lower bound only: the GTK and libadwaita the binary is built against (the `v4_12` and
# `v1_5` features in crates/okuri/Cargo.toml). Both keep binary compatibility across minor
# releases, so a newer one runs this fine; an older one is what would be missing symbols.
depends=('glibc' 'gcc-libs' 'gtk4>=4.12' 'libadwaita>=1.5')
provides=('okuri')
conflicts=('okuri')
options=('!debug')
# The icons are fetched from the tag rather than committed here. They are already at the sizes
# hicolor wants, so nothing has to be resized and nothing has to be installed to do it.
source=('LICENSE'
        'okuri.desktop'
        "$_binname-48-$pkgver.png::$url/raw/v$pkgver/assets/icons/$_binname-48.png"
        "$_binname-64-$pkgver.png::$url/raw/v$pkgver/assets/icons/$_binname-64.png"
        "$_binname-128-$pkgver.png::$url/raw/v$pkgver/assets/icons/$_binname-128.png"
        "$_binname-256-$pkgver.png::$url/raw/v$pkgver/assets/icons/$_binname-256.png")
source_x86_64=("$_binname-$pkgver::$url/releases/download/v$pkgver/$_binname-linux-amd64")
source_aarch64=("$_binname-$pkgver::$url/releases/download/v$pkgver/$_binname-linux-arm64")
sha256sums=('1b1357d052d290abaf31c1ee06be0d37001838123f7c1f1a506dec646c10069c'
            'd165ba2efe557e29940a7a8f3bc0b25f864f6b755d5f861507bab6a519c2b4fe'
            'e25aad22966f439888695364a55b62009cff3b10257caa4344510c38e32b7ee7'
            '5abbc057afa7075e8bc9bdfa4837fe0e291b1814e762aafdd7aa5f1a0389c4c7'
            'd540ec7fa7c45910c9677d8334b8769e9d69cf8178efd1028e4ef8b118081209'
            'a8261ebd8a20c8fffb2abbb3d1204ff3e3be29d8f1b52421daf4cedff633af9a')
sha256sums_x86_64=('e3181e7256ee5c2303630a29edac5bd8db7358d072a532c1fbf1d5b6d8d60637')
sha256sums_aarch64=('36f2ce6e7bb38d4021fb5601a654e22e53d9777ed9585debf4f3b779fbe14160')

package() {
  install -Dm755 "$_binname-$pkgver" "$pkgdir/usr/bin/$_binname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 okuri.desktop "$pkgdir/usr/share/applications/$_binname.desktop"

  for size in 48 64 128 256; do
    install -Dm644 "$_binname-$size-$pkgver.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$_binname.png"
  done
}
