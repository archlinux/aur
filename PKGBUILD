# Maintainer: Jean Lucas <jean at 4ray dot co>
# Contributor: Jonas Heinrich <onny at project-insanity dot org>

pkgname=tor-messenger-bin
pkgver=0.3.0b2
_language='en-US'
pkgrel=1
pkgdesc="Tor Messenger is +1 for privacy and -1 for mass surveillance"
arch=('i686' 'x86_64')
url="https://www.torproject.org"
license=('MIT')
source_i686=("https://dist.torproject.org/tormessenger/${pkgver}/tor-messenger-linux32-${pkgver}_${_language}.tar.xz")
source_x86_64=("https://dist.torproject.org/tormessenger/${pkgver}/tor-messenger-linux64-${pkgver}_${_language}.tar.xz")
source+=(tor-messenger.desktop
         tor-messenger.png
         tor-messenger.sh)
sha256sums_i686=('49c72bffd15d64f880e3d81bda7e1843f48fc645875eae903c01d5ab8543913c')
sha256sums_x86_64=('1d8ebf019c7b7c8d8a949cfb3bcefc85c0d876dd91c18b052d616f23b82c5df6')
sha256sums+=('f0df8e7237c295d81a991ba72e59cbbc7e3ade6d49f5178ed4aa226f8b7d5da0'
             '967353473d53da791bfb16eaf55e9a95b1d059502e40b0aaae7a1ab297f7d259'
	     'dd817794af9633ef635e24f9994854728914c47814e3dcc1785649529cb87968')
noextract_i686="tor-messenger-linux32-${pkgver}_${_language}.tar.xz"
noextract_x86_64="tor-messenger-linux64-${pkgver}_${_language}.tar.xz"

package() {
  cd ${srcdir}

  sed -i \
    -e "s|REPL_VERSION|${pkgver}|g" \
    -e "s|REPL_LANGUAGE|${_language}|g" \
    tor-messenger.sh
    
  install -Dm 0644 tor-messenger.desktop  ${pkgdir}/usr/share/applications/tor-messenger.desktop
  install -Dm 0644 tor-messenger.png      ${pkgdir}/usr/share/pixmaps/tor-messenger.png
  install -Dm 0755 tor-messenger.sh       ${pkgdir}/usr/bin/tor-messenger

  if [ "$CARCH" == "i686" ]; then
    install -Dm 0644 tor-messenger-linux32-${pkgver}_${_language}.tar.xz ${pkgdir}/opt/tor-messenger/tor-messenger-linux32-${pkgver}_${_language}.tar.xz
  else
    install -Dm 0644 tor-messenger-linux64-${pkgver}_${_language}.tar.xz ${pkgdir}/opt/tor-messenger/tor-messenger-linux64-${pkgver}_${_language}.tar.xz
  fi
}
