# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: jyantis <yantis@yantis.net>
# Contributor: Tristelune

pkgname=dvdae-bin
pkgver=8.4.1
pkgrel=1
pkgdesc="DVD audio extract & ripping tool for extracting streams from DVD-Audio & Video discs and save them as OGG, MP3, Wave or FLAC files"
arch=(x86_64)
url="https://www.dvdae.com/"
license=('custom: Computer Application Studio EULA')
depends=(flac1.3 gtk3 lame libvorbis libsm alsa-lib)
makedepends=(chrpath)
source=("https://www.dvdae.com/dvdae/dvdae_${pkgver}_amd64.deb"
        "https://www.dvdae.com/license.htm")
sha256sums=('8a8de84078471bd877460610d1f51bdb438f2f576c2f16f0b95dc155482346b2'
            '6d780e47d8c961a64fb12815872f2bf622018ff0623a9dd82abe59790cee0550')

package() {
  cd "$srcdir"
  bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/
  install -D -m644 license.htm "${pkgdir}/usr/share/licenses/${pkgname}/license.htm"

  chrpath --delete "${pkgdir}/usr/bin/dvdae"
  chrpath --delete "${pkgdir}/usr/bin/dvdae-gui"
  chown root:root -vR "${pkgdir}/"
  chmod 755 -vR "${pkgdir}/"
}
