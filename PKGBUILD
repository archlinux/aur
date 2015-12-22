# Based on fmodex from community repo
# Maintainer: Jan Cholasta <grubber at grubber cz>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=fmodex4.26.36
pkgver=4.26.36
pkgrel=3
pkgdesc="An advanced audio engine (version 4.26.36)"
arch=('i686' 'x86_64')
url="http://www.fmod.org/"
license=('custom')
sha256sums=('b3a9bc8f385f69510df895eda68e8d7a7a8a4fa9eae040b880880a4ceea7f7ab')
[ "$CARCH" = "x86_64" ] && {
	_pkgarch=64
}
source=("ftp://ftp.gwdg.de/pub/linux/misc/suser-jengelh/openSUSE_13.2/src/libfmodex426-4.26.36-2.2.src.rpm")

package() {
  bsdtar -xf fmodapi${pkgver//./}linux${_pkgarch}.tar.xz

  cd fmodapi${pkgver//./}linux${_pkgarch}

  mkdir -p ${pkgdir}/usr/lib
  mkdir -p ${pkgdir}/usr/include/fmodex-4.26.36

  cp -d api/lib/* ${pkgdir}/usr/lib/
  find ${pkgdir}/usr/lib/ -type l -delete

  if [[ $CARCH == "x86_64" ]]; then
    cd ${pkgdir}/usr/lib
    ln -sf libfmodex64-${pkgver}.so libfmodex-${pkgver}.so
    ln -sf libfmodex64L-${pkgver}.so libfmodexL-${pkgver}.so
    ln -sf libfmodexp64-${pkgver}.so libfmodexp-${pkgver}.so
    cd ${srcdir}/fmodapi${pkgver//./}linux${_pkgarch}
  fi

  cp api/inc/* ${pkgdir}/usr/include/fmodex-4.26.36/

  install -Dm644 documentation/LICENSE.TXT ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  mkdir -p ${pkgdir}/usr/share/doc/fmodex-4.26.36
  cp -r documentation examples ${pkgdir}/usr/share/doc/fmodex-4.26.36
}
