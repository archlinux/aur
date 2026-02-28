# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: jyantis <yantis@yantis.net>
# Contributor: Tristelune

pkgname=dvdae-bin
pkgver=8.8.0
pkgrel=1
pkgdesc="DVD audio extract & ripping tool for extracting streams from DVD-Audio & Video discs and save them as OGG, MP3, Wave or FLAC files"
arch=(x86_64)
url="https://www.dvdae.com/"
license=('LicenseRef-Computer_Application_Studio_EULA')
depends=(gtk3 lame libvorbis libsm alsa-lib
         flac1.4 # libFLAC.so.12

         # namcap implicit depends
         zlib expat glibc gdk-pixbuf2 libcap cairo libogg fontconfig pango pcre2 gcc-libs glib2 libpng
         libxkbcommon libjpeg-turbo libx11 curl)
makedepends=(chrpath)
install=dvdae.install
source=("https://www.dvdae.com/license.htm")
source_x86_64=("https://www.dvdae.com/dvdae/dvdae_${pkgver}_amd64.deb")
sha256sums=('6d780e47d8c961a64fb12815872f2bf622018ff0623a9dd82abe59790cee0550')
sha256sums_x86_64=('b94efcf356fd819ac0d109d4e944f7a670f00097c72be044e6e1a5e9d8842256')

package() {
  bsdtar -xf "${srcdir}"/data.tar.zst -C "${pkgdir}/"
  install -D -m644 license.htm "${pkgdir}/usr/share/licenses/${pkgname}/license.htm"

  chrpath --delete "${pkgdir}/usr/bin/dvdae"
  chrpath --delete "${pkgdir}/usr/bin/dvdae-gui"
  chown root:root -vR "${pkgdir}/"
  chmod 755 -vR "${pkgdir}/"

  ldd "${pkgdir}/usr/bin/dvdae" | grep -i libflac
}
