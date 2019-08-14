# Maintainer: Alexandros Theodotou <alex at zrythm dot org>
pkgname=zrythm-man
pkgver=0.6.003
pkgrel=1
pkgdesc='User manual for Zrythm'
arch=('any')
url='https://manual.zrythm.org'
license=('AGPL3')
depends=()
makedepends=('gettext' 'python-sphinx')
options=('!debug')
source=("https://download.savannah.nongnu.org/releases/zrythm/zrythm-manual-$pkgver.tar.gz"{,.asc})
sha256sums=('df61be544137ce7bdbf27f0a3ff3301c9cd888a0e61841f63f9aa752a8f9a5d8'
            'SKIP')
validpgpkeys=('48132384AD3DF7D86E254B83022EAE42313D70F3')

_languages=('de' 'fr' 'ja')

build() {
  make man latexpdf
}

package() {
  mkdir -p ${pkgdir}/usr/share/man/man1/
  mkdir -p ${pkgdir}/usr/share/zrythm/manual/
  install -D -m644 _build/en/man/zrythm.1 "${pkgdir}/usr/share/man/man1/"
  install -D -m644 _build/en/latex/Zrythm.pdf "${pkgdir}/usr/share/zrythm/manual/en.pdf"

  # install localized man pages and pdf manuals
  for lang in "${_languages[@]}"; do
    mkdir -p "${pkgdir}/usr/share/man/$lang/man1"
    install -D -m644 _build/$lang/man/zrythm.1 "${pkgdir}/usr/share/man/$lang/man1/"
    install -D -m644 _build/$lang/latex/Zrythm.pdf "${pkgdir}/usr/share/zrythm/manual/$lang.pdf"
  done
}
