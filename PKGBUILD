# Maintainer: Jean Lucas <jean at 4ray dot co>
# Contributor: Jonas Heinrich <onny at project-insanity dot org>

pkgname=tor-messenger-bin
pkgver=0.2.0b2
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
sha256sums_i686=('ca57984710785fb638f41eaa33ad6c58e614ebaccd4ce45dce803dd49b498992')
sha256sums_x86_64=('a1f8cfc5d127ea35b456a17a2542cb8a4aaa8f129fcd312a58d3f0c6d6e4b3c2')
sha512sums+=('837e4fdc2acec2a4c2841de8d149fdf1ca637b62879978b73edaa9be36e95c9fefdeae86d3d7ae9f77119faaceeec1bbac4078ed31caf554939723af93dbdaf9'
             '6007a2fc63d33ceaee78c40e196d339bc9c40e73b45934416878f4dc4be6dbe7dbe364d1cdd6a811d0c0a5bd70c463300e3df4e40e8369a20e3d6a8a04059042'
             '392b1a1faaeb154733869d96f8ba256aa882b21e374f6bbeee541b85f31dff99e191cd60e3382060051b468fb5c9d466621f31c1e7307811150b3bd35c8f80f1')
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
