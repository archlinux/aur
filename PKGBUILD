# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: jyantis <yantis@yantis.net>
# Contributor: Tristelune

pkgname=dvdae-bin
pkgver=8.4.2
pkgrel=1
pkgdesc="DVD audio extract & ripping tool for extracting streams from DVD-Audio & Video discs and save them as OGG, MP3, Wave or FLAC files"
arch=(x86_64)
url="https://www.dvdae.com/"
license=('custom: Computer Application Studio EULA')
depends=(flac1.3 gtk3 lame libvorbis libsm alsa-lib)
makedepends=(chrpath)
install=dvdae.install
source=("https://www.dvdae.com/license.htm")
source_x86_64=("https://www.dvdae.com/dvdae/dvdae_${pkgver}_amd64.deb")
sha256sums=('6d780e47d8c961a64fb12815872f2bf622018ff0623a9dd82abe59790cee0550')
sha256sums_x86_64=('f571b4102bfccf3b16deb0ba10ccf5c0c87ecd4c7cd5b218d41b082fcffd8002')

package() {
  cd "$srcdir"
  bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/
  install -D -m644 license.htm "${pkgdir}/usr/share/licenses/${pkgname}/license.htm"

  chrpath --delete "${pkgdir}/usr/bin/dvdae"
  chrpath --delete "${pkgdir}/usr/bin/dvdae-gui"
  chown root:root -vR "${pkgdir}/"
  chmod 755 -vR "${pkgdir}/"
}
