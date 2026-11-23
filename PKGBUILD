# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: jyantis <yantis@yantis.net>
# Contributor: Tristelune

pkgname=dvdae-bin
pkgver=8.9.0
pkgrel=1
pkgdesc="DVD audio extract & ripping tool for extracting streams from DVD-Audio & Video discs and save them as OGG, MP3, Wave or FLAC files"
arch=(x86_64)
url="https://www.dvdae.com/"
license=('LicenseRef-Computer_Application_Studio_EULA')
depends=(
    alsa-lib
    cairo
    curl
    expat
    flac     # libFLAC.so.14
    fontconfig
    gdk-pixbuf2
    glib2
    glibc
    gtk3
    lame
    libcap
    libgcc
    libogg
    libpng
    libsm
    libstdc++
    libvorbis
    libx11
    libxkbcommon
    pango
    pcre2
    zlib
    )
makedepends=(chrpath)
install=dvdae.install
source=("https://www.dvdae.com/license.htm")
source_x86_64=("https://www.dvdae.com/dvdae/dvdae_${pkgver}_amd64.deb")
sha256sums=('6d780e47d8c961a64fb12815872f2bf622018ff0623a9dd82abe59790cee0550')
sha256sums_x86_64=('b899d43fe05b7bac13bf99fb6df67b865add755e71b9ed644e34f40b66521797')

package() {
  bsdtar -xf "${srcdir}"/data.tar.zst -C "${pkgdir}/"
  install -D -m644 license.htm "${pkgdir}/usr/share/licenses/${pkgname}/license.htm"

  chrpath --delete "${pkgdir}/usr/bin/dvdae"
  chrpath --delete "${pkgdir}/usr/bin/dvdae-gui"
  chown root:root -vR "${pkgdir}/"
  chmod 755 -vR "${pkgdir}/"

  # print libflac .so version
  ldd "${pkgdir}/usr/bin/dvdae" | grep -i libflac
}
