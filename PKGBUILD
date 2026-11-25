# Maintainer: Nils Pukropp <contact@narl.io>
pkgname=proton-stream-bin
pkgver=2.5.0
pkgrel=1
pkgdesc="Unofficial media library for Proton Drive: browse and stream public links and your own Drive folders (binaries)"
arch=('x86_64')
url="https://github.com/narrrl/proton-stream"
_repo="https://github.com/narrrl/proton-stream"
license=('MIT')
depends=('mpv' 'libsecret' 'webkit2gtk-4.1' 'libglvnd' 'libxkbcommon' 'libx11'
         'wayland' 'hicolor-icon-theme' 'gcc-libs' 'glibc')
optdepends=('gnome-keyring: credential storage over the Secret Service API'
            'kwallet: credential storage over the Secret Service API')
provides=("${pkgname%-bin}=$pkgver" 'pstr')
conflicts=('proton-stream' 'proton-stream-git')
# Upstream ships binaries already built on Ubuntu 24.04; do not rewrite them.
options=('!strip' '!debug')
_tag="v$pkgver"
_archive="proton-stream-$pkgver-x86_64-unknown-linux-gnu"
# The release tarball holds the binaries, the icon and the license. The
# desktop entry and the AppStream metadata come from the same tag.
source=("$_archive.tar.gz::$_repo/releases/download/$_tag/$_archive.tar.gz"
        "io.narl.proton-stream-$pkgver.desktop::https://raw.githubusercontent.com/narrrl/proton-stream/$_tag/packaging/io.narl.proton-stream.desktop"
        "io.narl.proton-stream-$pkgver.metainfo.xml::https://raw.githubusercontent.com/narrrl/proton-stream/$_tag/packaging/io.narl.proton-stream.metainfo.xml")
sha256sums=('1101a9074d2817d5fa156c0dd8daee3398b4be95bc914046eb2066b4cfe9c5e9'
            '5e0a6db50a728dbf3872fd022677d7a14683a20585e565c616d18bce3a3f0718'
            'a25ca13e723fa7f4ebd7b4645aec52708f1351e4b05b71f16ff97dfd1a6feb5b')

package() {
  cd "$srcdir/$_archive"
  install -Dm755 proton-stream "$pkgdir/usr/bin/proton-stream"
  install -Dm755 pstr "$pkgdir/usr/bin/pstr"
  install -Dm644 io.narl.proton-stream.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.narl.proton-stream.svg"
  install -Dm644 "$srcdir/io.narl.proton-stream-$pkgver.desktop" \
    "$pkgdir/usr/share/applications/io.narl.proton-stream.desktop"
  install -Dm644 "$srcdir/io.narl.proton-stream-$pkgver.metainfo.xml" \
    "$pkgdir/usr/share/metainfo/io.narl.proton-stream.metainfo.xml"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
