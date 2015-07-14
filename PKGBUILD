# Maintainer: Eli Schwartz <eschwartz93@gmail.com>
# Contributor: AndyRTR <andyrtr@archlinux.org>

pkgname=hunspell-en-base
pkgver=2015.05.18
pkgrel=4
pkgdesc="US English hunspell dictionaries"
arch=('any')
url="http://wordlist.aspell.net/dicts/"
license=('LGPL' 'custom:scowl')
optdepends=('hunspell: the spell checking libraries and apps')
conflicts=('hunspell-en')
source=("http://downloads.sourceforge.net/project/wordlist/speller/${pkgver}/hunspell-en_US-${pkgver}.zip")
sha256sums=('ddea773af2f73cb6d00eb30cbadca2e8dbd86205bb1585c1ea455fbf90fde3e6')

prepare() {
  sed -i "s:SET UTF8:SET UTF-8:g"  en_US.aff
}

package() {
  cd "${srcdir}"
  install -dm755 "${pkgdir}/usr/share/hunspell"
  install -m644 en_US.dic en_US.aff "${pkgdir}/usr/share/hunspell"

  # the symlinks
  install -dm755 "${pkgdir}/usr/share/myspell/dicts"
  ln -s /usr/share/hunspell/en_US.dic "${pkgdir}/usr/share/myspell/dicts/"
  ln -s /usr/share/hunspell/en_US.aff "${pkgdir}/usr/share/myspell/dicts/"

  # docs
  install -Dm644 README_en_US.txt "${pkgdir}/usr/share/doc/${pkgname}/README_en_US.txt"

  # licenses
  install -Dm644 README_en_US.txt "${pkgdir}/usr/share/licenses/${pkgname}/Copyright_en_US"
}
