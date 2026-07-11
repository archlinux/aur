# Maintainer: Briar <briar@batforge.dev>
pkgname=music-presence-bin
pkgver=2.3.6
pkgrel=5
pkgdesc="The Discord music status that works with any media player "
arch=('x86_64')
url="https://github.com/ungive/discord-music-presence"
license=('custom')
options=(!debug)
depends=('brotli' 'bzip2' 'dbus' 'e2fsprogs' 'expat' 'fontconfig' 'freetype2' 'glib2' 'glibc' 'icu' 'keyutils' 'krb5' 'libgcc' 'libglvnd' 'libpng' 'libstdc++' 'libx11' 'libxau' 'libxcb' 'libxdmcp' 'libxkbcommon' 'openssl' 'pcre2' 'systemd-libs' 'zlib' 'zstd')

source=("https://github.com/ungive/discord-music-presence/releases/download/v2.3.6/musicpresence-2.3.6-linux-x86_64.deb" "https://raw.githubusercontent.com/ungive/discord-music-presence/refs/heads/master/LICENSE.md")
sha256sums=('e38c7676e32907c9b8e9601f4088eccfc6aff6f8b509439ed60d71c5fbfd80e8' '05b6af01c1775025a039a9f81d61aff6a8d15b460c8dc146e098a3721cfe2229')

package() {
  # Extract deb (ar archive)
  bsdtar -xf "musicpresence-2.3.6-linux-x86_64.deb" -C "${srcdir}"

  # Extract data.tar.* into pkgdir
  bsdtar -xf "${srcdir}/data.tar."* -C "${pkgdir}"

  # Remove bundled libraries
  rm -rf "$pkgdir/usr/lib"

  # Install license
  install -Dm644 "$srcdir/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"

}
