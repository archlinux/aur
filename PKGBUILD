#Maintainer: Larzid <juanitocampamocha@gmail.com>
pkgname=sotw
pkgver=0.5.6
pkgrel=1
epoch=
pkgdesc="Shadow Of The Wyrm is a single player, traditional roguelike by Julian Day."
arch=('x86_64')
url="http://www.shadowofthewyrm.org/"
license=('MIT')
groups=()
depends=('xerces-c' 'zlib' 'ncurses' 'lua51')
makedepends=('premake' 'mercurial' 'boost')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
changelog=
source=('hg+https://hg@bitbucket.org/prolog/shadow-of-the-wyrm')
noextract=()
md5sums=('SKIP')
validpgpkeys=()

build() {
	cd shadow-of-the-wyrm
	premake4 --lua_include=/usr/include/lua5.1 --lua_link=lua5.1 gmake
	make config=release
}

package() {
  echo "cd /usr/share/shadow-of-the-wyrm/sotw" > ${srcdir}/${pkgname}/sotw.sh
  echo "./sotw" >> ${srcdir}/${pkgname}/sotw.sh
  chmod +x ${srcdir}/${pkgname}/sotw.sh
  install -D -m644 ${srcdir}/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -d -m777 ${srcdir}/${pkgname}/sotw "${pkgdir}/usr/share/${pkgname}/sotw"
  install -D ${srcdir}/${pkgname}/sotw/howdoi.txt "${pkgdir}/usr/share/${pkgname}/sotw/howdoi.txt"
  install -D ${srcdir}/${pkgname}/sotw/README.md "${pkgdir}/usr/share/${pkgname}/sotw/README.md"
  install -D ${srcdir}/${pkgname}/sotw/shadowofthewyrmtext_blank.ini "${pkgdir}/usr/share/${pkgname}/sotw/shadowofthewyrmtext_blank.ini"
  install -D ${srcdir}/${pkgname}/sotw/shadowofthewyrmtext_en.ini "${pkgdir}/usr/share/${pkgname}/sotw/shadowofthewyrmtext_en.ini"
  install -D ${srcdir}/${pkgname}/sotw/sotw "${pkgdir}/usr/share/${pkgname}/sotw/sotw"
  install -D ${srcdir}/${pkgname}/sotw/swyrm.ini "${pkgdir}/usr/share/${pkgname}/sotw/swyrm.ini"
  install -D ${srcdir}/${pkgname}/ShadowOfTheWyrm "${pkgdir}/usr/share/${pkgname}/ShadowOfTheWyrm"
  install -D ${srcdir}/${pkgname}/shadowofthewyrmtext_blank.ini "${pkgdir}/usr/share/${pkgname}/shadowofthewyrmtext_blank.ini"
  install -D ${srcdir}/${pkgname}/shadowofthewyrmtext_en.ini "${pkgdir}/usr/share/${pkgname}/shadowofthewyrmtext_en.ini"
  install -D ${srcdir}/${pkgname}/swyrm.ini "${pkgdir}/usr/share/${pkgname}/swyrm.ini"
  cp -R ${srcdir}/${pkgname}/sotw/data ${pkgdir}/usr/share/${pkgname}/sotw/data
  cp -R ${srcdir}/${pkgname}/sotw/docs ${pkgdir}/usr/share/${pkgname}/sotw/docs
  cp -R ${srcdir}/${pkgname}/sotw/licenses ${pkgdir}/usr/share/${pkgname}/sotw/licenses
  cp -R ${srcdir}/${pkgname}/sotw/scripts ${pkgdir}/usr/share/${pkgname}/sotw/scripts
  cp -R ${srcdir}/${pkgname}/sotw/texts ${pkgdir}/usr/share/${pkgname}/sotw/texts
  install -D ${srcdir}/${pkgname}/sotw.sh ${pkgdir}/usr/bin/sotw  
}