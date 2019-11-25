#Maintainer: Larzid <juanitocampamocha@gmail.com>
pkgname=sotw
pkgver=1.1.5
pkgrel=1
epoch=
pkgdesc="Shadow Of The Wyrm is a single player, traditional roguelike by Julian Day."
arch=('x86_64')
url="http://www.shadowofthewyrm.org/"
license=('MIT')
groups=()
depends=('xerces-c' 'zlib' 'ncurses' 'lua51' 'boost' 'gtest')
makedepends=('premake' 'git')
checkdepends=()
provides=(sotw)
conflicts=(sotw-dev)
replaces=()
backup=()
options=()
changelog=
source=('git+https://github.com/prolog/shadow-of-the-wyrm.git')
noextract=()
md5sums=('SKIP')
validpgpkeys=()

build() {
	cd shadow-of-the-wyrm
	git checkout stable
	premake4 --lua_include=/usr/include/lua5.1 --lua_link=lua5.1 gmake
	make config=release
	#make config=debug
}

package() {
  echo "cd /usr/share/shadow-of-the-wyrm/sotw" > ${srcdir}/shadow-of-the-wyrm/sotw.sh
  echo "./sotw" >> ${srcdir}/shadow-of-the-wyrm/sotw.sh
  chmod +x ${srcdir}/shadow-of-the-wyrm/sotw.sh
  install -D -m644 ${srcdir}/shadow-of-the-wyrm/LICENSE "${pkgdir}/usr/share/licenses/shadow-of-the-wyrm/LICENSE"
  install -d -m777 ${srcdir}/shadow-of-the-wyrm/sotw "${pkgdir}/usr/share/shadow-of-the-wyrm/sotw"
  install -D ${srcdir}/shadow-of-the-wyrm/sotw/howdoi.txt "${pkgdir}/usr/share/shadow-of-the-wyrm/sotw/howdoi.txt"
  install -D ${srcdir}/shadow-of-the-wyrm/sotw/README.md "${pkgdir}/usr/share/shadow-of-the-wyrm/sotw/README.md"
  install -D ${srcdir}/shadow-of-the-wyrm/sotw/shadowofthewyrmtext_blank.ini "${pkgdir}/usr/share/shadow-of-the-wyrm/sotw/shadowofthewyrmtext_blank.ini"
  install -D ${srcdir}/shadow-of-the-wyrm/sotw/shadowofthewyrmtext_en.ini "${pkgdir}/usr/share/shadow-of-the-wyrm/sotw/shadowofthewyrmtext_en.ini"
  install -D ${srcdir}/shadow-of-the-wyrm/sotw/sotw "${pkgdir}/usr/share/shadow-of-the-wyrm/sotw/sotw"
  install -D ${srcdir}/shadow-of-the-wyrm/sotw/swyrm.ini "${pkgdir}/usr/share/shadow-of-the-wyrm/sotw/swyrm.ini"
  install -D ${srcdir}/shadow-of-the-wyrm/ShadowOfTheWyrm "${pkgdir}/usr/share/shadow-of-the-wyrm/ShadowOfTheWyrm"
  install -D ${srcdir}/shadow-of-the-wyrm/shadowofthewyrmtext_blank.ini "${pkgdir}/usr/share/shadow-of-the-wyrm/shadowofthewyrmtext_blank.ini"
  install -D ${srcdir}/shadow-of-the-wyrm/shadowofthewyrmtext_en.ini "${pkgdir}/usr/share/shadow-of-the-wyrm/shadowofthewyrmtext_en.ini"
  install -D ${srcdir}/shadow-of-the-wyrm/swyrm.ini "${pkgdir}/usr/share/shadow-of-the-wyrm/swyrm.ini"
  cp -R ${srcdir}/shadow-of-the-wyrm/sotw/data ${pkgdir}/usr/share/shadow-of-the-wyrm/sotw/data
  cp -R ${srcdir}/shadow-of-the-wyrm/sotw/docs ${pkgdir}/usr/share/shadow-of-the-wyrm/sotw/docs
  cp -R ${srcdir}/shadow-of-the-wyrm/sotw/licenses ${pkgdir}/usr/share/shadow-of-the-wyrm/sotw/licenses
  cp -R ${srcdir}/shadow-of-the-wyrm/sotw/scripts ${pkgdir}/usr/share/shadow-of-the-wyrm/sotw/scripts
  cp -R ${srcdir}/shadow-of-the-wyrm/sotw/texts ${pkgdir}/usr/share/shadow-of-the-wyrm/sotw/texts
  install -D ${srcdir}/shadow-of-the-wyrm/sotw.sh ${pkgdir}/usr/bin/sotw
}
