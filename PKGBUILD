# Maintainer: Lukas Jirkovsky <l DOT jirkovsky AT gmail DOT com>
pkgname=3delight
pkgver=11.0.168
pkgrel=1
pkgdesc="Fast, high quality, RenderMan-compliant renderer"
arch=('x86_64')
url="http://www.3delight.com/"
license=('custom')
depends=('mesa' 'gtk2' 'libpng12' 'libxxf86vm')
makedepends=('wget')
DLAGENTS=('http::/usr/bin/wget --tries=3 --output-document=%o %u')
source=("http://www.3delight.com/downloads/free/3delight-$pkgver-Linux-x86_64.tar.xz")
md5sums=('26070c799ae1c30a4358048018b92223')

package() {
  cd "$srcdir"/$pkgname-$pkgver-Linux-x86_64
  # some sed magic
  sed "s|INSTALLDIR|/opt/3delight|1" .3delight_bash.in > .3delight_bash
  sed "s|INSTALLDIR|/opt/3delight|1" .3delight_csh.in > .3delight_csh

  mkdir -p "$pkgdir"/opt
  cp -R 3delight "$pkgdir"/opt
  install -D -m755 .3delight_bash "$pkgdir"/etc/profile.d/3delight.sh
  install -D -m755 .3delight_csh "$pkgdir"/etc/profile.d/3delight.csh

  install -D -m644 LicensingAgreement.txt "$pkgdir"/usr/share/licenses/$pkgname/License
}
