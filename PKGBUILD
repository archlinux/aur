# Contributor: Yumi Nanako <yumileroy [at] yahoo.com>

pkgname=wordplay
pkgver=7.22
pkgrel=5
pkgdesc="Wordplay generates anagrams of words or phrases. For example, Debian GNU/Linux = laud benign unix, nubian lug index, dang nubile unix, or I debug in lax nun."
arch=('i686' 'x86_64')
url="http://hsvmovies.com/static_subpages/personal_orig/wordplay/index.html"
license=('GPL')
depends=('words')
source=(http://archive.ubuntu.com/ubuntu/pool/universe/w/wordplay/${pkgname}_${pkgver}.orig.tar.gz
	wordplay_7.22-1.diff)
md5sums=('785f8a6e9410b2634e88f0bceb7e1743' 'e937490b802a4adcdbb960adf43bbc86')

build() {
  cd "$srcdir/"
  cp -R ${pkgname}-${pkgver}.orig ${pkgname}-${pkgver}

  patch -p0 -i wordplay_7.22-1.diff
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

