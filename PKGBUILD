# Maintainer: AnonMiraj <ezzibrahimx@gmail.com>
# Prebuilt binaries come from the upstream release workflow:
# https://github.com/AnonMiraj/Tanin/blob/main/.github/workflows/release.yml
#
# Bundled sounds (~17 MB) are NOT shipped: tanin downloads them from
# raw.githubusercontent.com on first launch into the user's data dir.
#
# Asset names must stay in sync with github.ref_name and the workflow matrix.

pkgname=tanin-bin
pkgver=0.1.1
pkgrel=1
pkgdesc='A TUI ambient sound generator written in Rust'
arch=('x86_64' 'aarch64')
url='https://github.com/AnonMiraj/Tanin'
license=('MIT')
depends=('alsa-lib' 'openssl' 'opus' 'gcc-libs')
optdepends=('yt-dlp: for downloading custom sounds from YouTube')
provides=('tanin')
conflicts=('tanin' 'tanin-git')
options=('!strip')

source_x86_64=("$url/releases/download/v$pkgver/tanin-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/tanin-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('3f135a717605596635a579f6b8975d777ab9e86a80dff3ada299d2511b442068')
sha256sums_aarch64=('4a295caca064716929482add99947cf1c8c52ac11f46ca44b8651764caa8a84e')

package() {
  cd "$srcdir"

  install -Dm755 tanin "$pkgdir/usr/bin/tanin"

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 ADDING_SOUNDS.md "$pkgdir/usr/share/doc/$pkgname/ADDING_SOUNDS.md"
  install -Dm644 SOUNDS_LICENSING.md "$pkgdir/usr/share/doc/$pkgname/SOUNDS_LICENSING.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
