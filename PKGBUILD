# Maintainer: nous at artixlinux.org
# Contributor: Yumi Nanako <yumileroy [at] yahoo.com>#

pkgname=wordplay
pkgver=8
pkgrel=2
pkgdesc="Wordplay generates anagrams of words or phrases. For example, Debian GNU/Linux = laud benign unix, nubian lug index, dang nubile unix, or I debug in lax nun."
arch=('i686' 'x86_64')
url="https://github.com/mendelmunkis/wordplay"
license=('GPL')
depends=('words')
source=(${pkgname}-${pkgver}.zip::https://github.com/mendelmunkis/wordplay/archive/refs/heads/master.zip
#http://archive.ubuntu.com/ubuntu/pool/universe/w/wordplay/${pkgname}_${pkgver}.orig.tar.gz
	wordplay_8-1.diff)
md5sums=('bec24fb9bcc24e11732402d49728705e'
         'f30b3f8f40cd787d2011476857f1fb8d')

build() {
  cd "$srcdir/"
  cp -a ${pkgname}-master ${pkgname}-${pkgver}
  patch -p0 -i wordplay_8-1.diff
  cd ${pkgname}-${pkgver}

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p ${pkgdir}/usr/bin/
  mkdir -p ${pkgdir}/usr/share/wordplay
  mkdir -p ${pkgdir}/usr/share/man/man1
  install -s wordplay ${pkgdir}/usr/bin/wordplay
  install -m 644 words721.txt ${pkgdir}/usr/share/wordplay
  gzip -9 wordplay.1
  install -m 644 wordplay.1.gz ${pkgdir}/usr/share/man/man1
}

