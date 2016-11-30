# Maintainer: Jean Lucas <jean at 4ray dot co>
# Contributor: Jonas Heinrich <onny at project-insanity dot org>

pkgname=tor-messenger-bin
pkgver=0.3.0b1
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
sha256sums_i686=('4ccb5484103a4bae62ba9b047e82a0abdcf4438507909e9152f9240a4f46d6f8')
sha256sums_x86_64=('f5a4aa5bcd096ecc4a2788eaca3c7978c42d058cde101635421798ca638ece5a')
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
