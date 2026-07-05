# Maintainer: voidlesity <me@voidlesity.dev>

pkgname=logseq-desktop-nightly-bin
pkgver=20260702
_appver=2.0.1-alpha
pkgrel=1
pkgdesc="Nightly build of Logseq, a privacy-first, open-source knowledge management platform"
arch=('x86_64' 'aarch64')
url="https://github.com/logseq/logseq"
license=('AGPL-3.0-or-later')
depends=('gtk3' 'nss' 'nspr' 'alsa-lib' 'mesa' 'libxkbcommon' 'libxcomposite' 'libxdamage' 'libxrandr' 'at-spi2-core' 'libcups' 'libsecret' 'desktop-file-utils')
provides=('logseq-desktop')
conflicts=('logseq-desktop')
options=('!strip')
install="$pkgname.install"

source=('logseq.desktop'
        "logseq.png::$url/raw/nightly/resources/icons/logseq.png")
source_x86_64=("$pkgname-$pkgver.zip::$url/releases/download/nightly/Logseq-linux-x86_64-$_appver+nightly.$pkgver.zip")
source_aarch64=("$pkgname-$pkgver.zip::$url/releases/download/nightly/Logseq-linux-arm64-$_appver+nightly.$pkgver.zip")
noextract=("$pkgname-$pkgver.zip")

sha256sums=('ef7d0d2efe04d880dae1c7046c76c11f70fd7e508f54d293cf88b8128bde7fd7'
            'e3801c054138a9cc5eb555c0cea985620716ddf621421369213da82b9fff557a')
sha256sums_x86_64=('0e55b3c704a1b0d6bcce1a227c0cd481dddedb44cdf46d21d468a28d00c324f8')
sha256sums_aarch64=('bab0c6f84d12e0a0ec08b26b0fcdc20b7ac3574452883c47e65474535640b4ec')

package() {
  # App files (the zip has no top-level folder, so extract it straight in).
  install -dm755 "$pkgdir/opt/$pkgname"
  bsdtar -xf "$pkgname-$pkgver.zip" -C "$pkgdir/opt/$pkgname"

  install -dm755 "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/logseq" "$pkgdir/usr/bin/logseq"

  install -Dm644 logseq.desktop "$pkgdir/usr/share/applications/logseq.desktop"
  install -Dm644 logseq.png "$pkgdir/usr/share/pixmaps/logseq.png"
}
