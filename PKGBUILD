# Based on fmodex from community repo
# Maintainer: Jan Cholasta <grubber at grubber cz>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=fmodex4.26.36
pkgver=4.26.36
pkgrel=1
pkgdesc="An advanced audio engine (version 4.26.36)"
arch=('i686' 'x86_64')
url="http://www.fmod.org/"
license=('custom')
md5sums=('220a54f330bdf3056d6207a0facf2096')
[ "$CARCH" = "x86_64" ] && {
	_pkgarch=64
	md5sums=('355cba00a34eb5f7d027da68b452f6d9')
}
source=("http://www.fmod.org/download/fmodex/api/Linux/fmodapi${pkgver//./}linux${_pkgarch}.tar.gz")

package() {
  cd fmodapi${pkgver//./}linux${_pkgarch}

  mkdir -p ${pkgdir}/usr/lib
  mkdir -p ${pkgdir}/usr/include/fmodex-4.26.36

  cp -d api/lib/* ${pkgdir}/usr/lib/
  find ${pkgdir}/usr/lib/ -type l -delete

  if [[ $CARCH == "x86_64" ]]; then
    cd ${pkgdir}/usr/lib
    ln -sf libfmodex64-${pkgver}.so libfmodex-${pkgver}.so
    ln -sf libfmodexL64-${pkgver}.so libfmodexL-${pkgver}.so
    ln -sf libfmodex64p-${pkgver}.so libfmodexp-${pkgver}.so
    cd ${srcdir}/fmodapi${pkgver//./}linux${_pkgarch}
  fi

  cp api/inc/* ${pkgdir}/usr/include/fmodex-4.26.36/

  install -Dm644 documentation/LICENSE.TXT ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  mkdir -p ${pkgdir}/usr/share/doc/fmodex-4.26.36
  cp -r documentation examples ${pkgdir}/usr/share/doc/fmodex-4.26.36
}
