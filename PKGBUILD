# Maintainer: Briar <briar@batforge.dev>
pkgname=music-presence-bin
pkgver=2.3.3
pkgrel=1
pkgdesc="The Discord music status that works with any media player "
arch=('x86_64')
url="https://github.com/ungive/discord-music-presence"
license=('custom')
depends=('glibc' 'gcc-libs' 'systemd' 'util-linux' 'libbsd' 'dbus' 'libgcrypt' 'glib2' 'krb5' 'keyutils' 'lz4' 'xz' 'pcre2' 'libpng' 'libxau' 'libxcb' 'libxdmcp' 'zstd' 'brotli' 'bzip2' 'e2fsprogs' 'mesa' 'expat' 'fontconfig' 'freetype2' 'gcc-libs' 'libgpg-error' 'libmd' 'libx11' 'zlib')
source=("https://github.com/ungive/discord-music-presence/releases/download/v2.3.3/musicpresence-2.3.3-linux-x86_64.deb" "https://raw.githubusercontent.com/ungive/discord-music-presence/refs/heads/master/LICENSE.md" "music-presence.desktop")
sha256sums=('5b947bc453ceb7c72a010953766d755355f93d20be2242557d6ff1e595bfc8ed' '91c04d54bf908cbc42acacbcb05e5bda2e32cc0b63b7eeb98a42cbcbaf3f2151' 'e5f4504301d0f5953774d1d08860ddd5c03149448a41e7823f64978d2b4b6bbf')

package() {
  # Extract deb (ar archive)
  bsdtar -xf "musicpresence-2.3.3-linux-x86_64.deb" -C "${srcdir}"

  # Extract data.tar.* into pkgdir
  bsdtar -xf "${srcdir}/data.tar."* -C "${pkgdir}"

  # Install license
  install -Dm644 "$srcdir/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"

  # Install desktop entry
  install -Dm644 "$srcdir/music-presence.desktop" \
    "$pkgdir/usr/share/applications/music-presence.desktop"
}
