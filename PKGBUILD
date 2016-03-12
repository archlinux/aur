# Maintainer: Jean Lucas <jean at 4ray dot co>
# Contributor: Jonas Heinrich <onny at project-insanity dot org>

pkgname=tor-messenger-bin
pkgver=0.1.0b5
_language='en-US'
pkgrel=1
pkgdesc="Tor Messenger is +1 for privacy and -1 for mass surveillance"
arch=('i686' 'x86_64')
url="https://www.torproject.org/"
license=('MIT')
source_i686=("https://dist.torproject.org/tormessenger/${pkgver}/tor-messenger-linux32-${pkgver}_${_language}.tar.xz")
source_x86_64=("https://dist.torproject.org/tormessenger/${pkgver}/tor-messenger-linux64-${pkgver}_${_language}.tar.xz")
source+=(tor-messenger.desktop
         tor-messenger.png
         tor-messenger.sh)
sha512sums_i686=('cc9925d7889c14d21b564529365556efb70b3f58d8dfcb03208d189c098fbf91a70f8a1d55f4261f64dcb5d4c06ebe7bd9fc73d42ec975980c7c59319d5d8b34')
sha512sums_x86_64=('c07f36074830bab8fbe4534480a771434562ef29e8565ff986e389e85649f7fef96738b48b8f1575bd4d26ec96122a8d09703efe70a906095e1d68272c9b897e')
sha512sums+=('837e4fdc2acec2a4c2841de8d149fdf1ca637b62879978b73edaa9be36e95c9fefdeae86d3d7ae9f77119faaceeec1bbac4078ed31caf554939723af93dbdaf9'
             '6007a2fc63d33ceaee78c40e196d339bc9c40e73b45934416878f4dc4be6dbe7dbe364d1cdd6a811d0c0a5bd70c463300e3df4e40e8369a20e3d6a8a04059042'
             'c20f4de84b868724a200645177e4a6094ba87cc0432c32ae775546e4115b4acd3369cd89725538b8da95de8587ee6ddd172d516bd19d0c7290be3e90fb8dca3c')
noextract_i686="tor-messenger-linux32-${pkgver}_${_language}.tar.xz"
noextract_x86_64="tor-messenger-linux64-${pkgver}_${_language}.tar.xz"

package() {
  cd ${srcdir}

  sed -i \
    -e "s|REPL_VERSION|${pkgver}|g" \
    -e "s|REPL_LANGUAGE|${_language}|g" \
    tor-messenger.sh

  install -Dm0644 tor-messenger.desktop ${pkgdir}/usr/share/applications/tor-messenger.desktop
  install -Dm0644 tor-messenger.png     ${pkgdir}/usr/share/pixmaps/tor-messenger.png
  install -Dm0755 tor-messenger.sh      ${pkgdir}/usr/bin/tor-messenger

  if [ '$CARCH' == 'i686' ] ; then
    install -Dm0644 tor-messenger-linux32-${pkgver}_${_language}.tar.xz ${pkgdir}/opt/tor-messenger/tor-messenger-linux32-${pkgver}_${_language}.tar.xz
  else
    install -Dm0644 tor-messenger-linux64-${pkgver}_${_language}.tar.xz ${pkgdir}/opt/tor-messenger/tor-messenger-linux64-${pkgver}_${_language}.tar.xz
  fi
}
