# Maintainer: Jean Lucas <jean at 4ray dot co>
# Contributor: Jonas Heinrich <onny at project-insanity dot org>

pkgname=tor-messenger-bin
pkgver=0.1.0b4
_language='en-US'
pkgrel=2
pkgdesc="A cross-platform chat program that aims to be secure by default and sends all of its traffic over Tor"
arch=('i686' 'x86_64')
url="https://www.torproject.org/"
license=('MIT')
source_i686=('https://dist.torproject.org/tormessenger/0.1.0b4/tor-messenger-linux32-0.1.0b4_en-US.tar.xz')
source_x86_64=('https://dist.torproject.org/tormessenger/0.1.0b4/tor-messenger-linux64-0.1.0b4_en-US.tar.xz')
source+=('tor-messenger.desktop'
         'tor-messenger.png'
         'tor-messenger.sh')
sha512sums_i686=('15660315f103e7e3e80603b6669662b854bd264bd944e76cbe0a150ee20a7c753936b404d99f08328775a2415c29b8f67505206829a2ec3a50c87d7a5ceacbb6')
sha512sums_x86_64=('d6bc2643ef754d0e090a6306a2bba2c5eea28ababfea38f9e656212ec1d9122714421219f24141e122f8af819ea83b53f6b3d91ff3a8d5ea0a15bbef10618fc6')
sha512sums+=('d504ead44500d1ab7b42d8184e7ab9619c6efa391852046823712e74b2935ebe5e985999936f19148e095df8f28969ad91e41f2809e02869667d904b735ac0db'
             '6007a2fc63d33ceaee78c40e196d339bc9c40e73b45934416878f4dc4be6dbe7dbe364d1cdd6a811d0c0a5bd70c463300e3df4e40e8369a20e3d6a8a04059042'
             '90a72254441ef167b9fb7641484561256a0b8c7c305eb05bf07b9691c63a033890d3658cbedd0eb7e2ef0d31f117486380b50592e2af40977d99d475ab313ab3')
noextract_i686=('tor-messenger-linux32-0.1.0b4_en-US.tar.xz')
noextract_x86_64=('tor-messenger-linux64-0.1.0b4_en-US.tar.xz')

package() {
  cd ${srcdir}

  sed -i 's/REPL_NAME/tor-messenger/g'    tor-messenger.sh
  sed -i 's/REPL_VERSION/${pkgver}/g'     tor-messenger.sh
  sed -i 's/REPL_LANGUAGE/${_language}/g' tor-messenger.sh

  sed -i 's/REPL_NAME/tor-messenger/g'    tor-messenger.desktop
  sed -i 's/REPL_COMMENT/${pkgdesc}/g'    tor-messenger.desktop
  sed -i 's/REPL_LANGUAGE/${_language}/g' tor-messenger.desktop

  install -Dm 644 tor-messenger.desktop   ${pkgdir}/usr/share/applications/tor-messenger.desktop
  install -Dm 644 tor-messenger.png       ${pkgdir}/usr/share/pixmaps/tor-messenger.png
  install -Dm 755 tor-messenger.sh        ${pkgdir}/usr/bin/tor-messenger

  if [[ '$CARCH' == 'i686' ]]; then
     install -Dm 644 tor-messenger-linux32-${pkgver}_${_language}.tar.xz ${pkgdir}/opt/tor-messenger/tor-messenger-linux32-${pkgver}_${_language}.tar.xz
  else
     install -Dm 644 tor-messenger-linux64-${pkgver}_${_language}.tar.xz ${pkgdir}/opt/tor-messenger/tor-messenger-linux64-${pkgver}_${_language}.tar.xz
  fi
}
