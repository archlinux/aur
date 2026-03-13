# Maintainer: nous at artixlinux.org
# Contributor: Yumi Nanako <yumileroy [at] yahoo.com>#

pkgname=wordplay
pkgver=9.0.1
pkgrel=1
pkgdesc="Wordplay generates anagrams of words or phrases. For example, Debian GNU/Linux = laud benign unix, nubian lug index, dang nubile unix, or I debug in lax nun."
arch=('i686' 'x86_64')
url="https://github.com/mendelmunkis/wordplay"
license=('GPL')
depends=('words')
source=(${pkgname}-${pkgver}.zip::https://github.com/mendelmunkis/wordplay/archive/refs/heads/master.zip
#http://archive.ubuntu.com/ubuntu/pool/universe/w/wordplay/${pkgname}_${pkgver}.orig.tar.gz
	wordplay-manpage.diff)
#	wordplay.1)
md5sums=('22a60ec1ec8c1ac8b2e5183f2ecdb09f'
         'efab941d04f63738ee60d86c49ab8bf9')

build() {
  cd "$srcdir"
  cp -a ${pkgname}-master ${pkgname}-build
  patch -p0 -i wordplay-manpage.diff
  cd ${pkgname}-build

  make
}

package() {
  cd "${srcdir}/${pkgname}-build"
  mkdir -p ${pkgdir}/usr/bin/
  mkdir -p ${pkgdir}/usr/share/wordplay
  mkdir -p ${pkgdir}/usr/share/man/man1
  install -s wordplay ${pkgdir}/usr/bin/wordplay
  install -m 644 words721.txt ${pkgdir}/usr/share/wordplay
  gzip -9 wordplay.1
  install -m 644 wordplay.1.gz ${pkgdir}/usr/share/man/man1
}

