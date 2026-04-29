# Maintainer: Arkadiusz Dzięgielewski <arek.dzski@gmail.com>

pkgname=teamspeak
pkgver=6.0.0beta4
pkgrel=1
pkgdesc="Software for quality voice communication via the Internet"
url="http://www.teamspeak.com"
license=('custom')
depends=(
         'alsa-lib' 'aom' 'at-spi2-core' 'avahi' 'brotli' 'bzip2' 'cairo' 'dav1d' 
         'dbus' 'expat' 'ffmpeg' 'fontconfig' 'freetype2' 'fribidi' 'gdk-pixbuf2' 'glib2' 
         'glibc' 'glycin' 'gmp' 'gnutls' 'graphite' 'gsm' 'harfbuzz' 'highway' 
         'icu' 'lame' 'lcms2' 'leancrypto' 'libatomic' 'libcups' 'libdatrie' 'libdrm' 
         'libffi' 'libgcc' 'libglvnd' 'libgomp' 'libidn2' 'libjxl' 'libnotify' 'libogg' 
         'libp11-kit' 'libpng' 'librsvg' 'libseccomp' 'libsoxr' 'libstdc++' 'libtasn1' 'libthai' 
         'libtheora' 'libunistring' 'libva' 'libvdpau' 'libvorbis' 'libvpl' 'libvpx' 'libwebp' 
         'libx11' 'libxau' 'libxcb' 'libxcomposite' 'libxdamage' 'libxdmcp' 'libxext' 'libxfixes' 
         'libxi' 'libxkbcommon' 'libxml2' 'libxrandr' 'libxrender' 'libxss' 'libxtst' 'mesa' 
         'mpg123' 'nettle' 'nspr' 'nss' 'ocl-icd' 'opencore-amr' 'openjpeg2' 'opus' 
         'pango' 'pcre2' 'pixman' 'rav1e' 'snappy' 'speex' 'svt-av1' 'systemd-libs' 
         'util-linux-libs' 'wayland' 'x264' 'x265' 'xvidcore' 'xz' 'zlib-ng-compat'
)
optdepends=('libpulse')
arch=('x86_64')
source=("teamspeak-client-$pkgver.tar.gz::https://files.teamspeak-services.com/pre_releases/client/${pkgver/beta/-beta}/teamspeak-client.tar.gz"
        "teamspeak-client.desktop")
sha512sums=('e3444539c591e197b6d7b32969ee2fe651e4158e4e5a8a4b39e1aeecb411f9b81377159bc94d298b88196d4a92b41d9f1d73beb7bf83ba238a4792a615d1247c'
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
