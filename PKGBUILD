# Maintainer: Arkadiusz Dzięgielewski <arek.dzski@gmail.com>

pkgname=teamspeak
pkgver=5.0.0beta76
pkgrel=1
pkgdesc="Software for quality voice communication via the Internet"
url="http://www.teamspeak.com"
license=('custom')
depends=('alsa-lib' 'atk' 'at-spi2-atk' 'at-spi2-core' 'avahi' 'dbus'
         'e2fsprogs' 'expat' 'flac' 'gcc-libs' 'glib2' 'glibc' 'gmp' 'gnutls'
         'keyutils' 'krb5' 'libasyncns' 'libcap' 'libcups' 'libdrm' 'libffi'
         'libgcrypt' 'libgpg-error' 'libidn2' 'libogg' 'libp11-kit' 'libpulse'
         'libsndfile' 'libtasn1' 'libunistring' 'libvorbis' 'libx11' 'libxau'
         'libxcb' 'libxcomposite' 'libxdamage' 'libxdmcp' 'libxext' 'libxfixes'
         'libxi' 'libxkbcommon' 'libxrandr' 'libxrender' 'libxshmfence' 'lz4'
         'mesa' 'nettle' 'nspr' 'nss' 'opus' 'pcre' 'systemd-libs'
         'util-linux-libs' 'wayland' 'xz' 'zlib' 'zstd')
optdepends=('libpulse')
arch=('x86_64')
source=("teamspeak-client-$pkgver.tar.xz::https://files.teamspeak-services.com/pre_releases/client/${pkgver/beta/-beta}/teamspeak-client.tar.gz"
        "teamspeak-client.desktop")
sha512sums=('9b21626623007d04d8b514a674c63ea8c0d0f7e2ffa585e9fb08da2bff593409f93c02a9394d3d118be208f636e9b1816934bef1068fae0844a18fb4b88f030e'
            '28f6cfbb842cd25d51819eccaa282aa0edd1e5b37e7eb14ef7e7e07723bd83fa7b3babc8f303021f83d3591a7d7f4db824f770c86d1b6a7326466e256cf787d0')

package() {
  install -d "$pkgdir"/{usr/{bin,share/{licenses,pixmaps}},opt/$pkgname}/

  # Recursively installing all top-level regular files and directories from srcdir
  #   Files supplied to makepkg as sources are present in srcdir using symbolic links
  #   That way we can only copy files extracted from source archives
  find "$srcdir" \
    -mindepth 1 \
    -maxdepth 1 \
    -type d,f \
    ! -name teamspeak-client.desktop \
    -exec cp -r {} "$pkgdir/opt/$pkgname/" \;

  chmod 0755 "$pkgdir/opt/$pkgname/TeamSpeak"
  chmod 0755 "$pkgdir/opt/$pkgname/hotkey_helper"

  install -Dm0644 "$srcdir/teamspeak-client.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  ln -s /opt/$pkgname/logo-256.png "$pkgdir/usr/share/pixmaps/teamspeak-client.png"
  ln -s /opt/$pkgname/licenses "$pkgdir/usr/share/licenses/$pkgname"
  ln -s /opt/$pkgname/TeamSpeak "$pkgdir/usr/bin/teamspeak"
}
