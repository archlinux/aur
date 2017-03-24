# Maintainer: aksr <aksr at t-com dot me>
pkgname=neatroff-hyph
pkgver=2016.05.16
pkgrel=1
epoch=
pkgdesc="Neatroff's hyphenation files (patterns, exceptions and mappings)."
arch=('i686' 'x86_64')
url="http://tug.ctan.org/tex-archive/language/hyph-utf8/tex/generic/hyph-utf8/patterns/txt/"
license=('various')
categories=()
groups=()
depends=('')
makedepends=()
optdepends=('neatroff')
checkdepends=()
provides=()
conflicts=('neatroff-suite-git')
replaces=()
backup=()
options=()
install=${pkgname}.install
changelog=
source=(tmac.hyph)
noextract=($pkgname)
options=()
md5sums=('400ca172da0400af0dd21086f25845f0')
sha1sums=('bdf1999665fd40813236b739db7e5edbef345c12')
sha256sums=('e2149092d239dcfc3127a1d3025a23c867b637858cb94eaf1301249197f514e4')

## MACROS directory
MDIR=/usr/share/neatroff/tmac

## HYPHENATION FILES
HYPH=usr/share/neatroff/hyph/

prepare() {
  cd "$srcdir/"
  mkdir hyph/ || return 0

  echo "Download hyphenation files:"
  LNG=(af as bg bn ca cop cs cu cy da eo es et eu fi fr fur ga gl grc gu
       de-1901 de-1996 de-ch-1901 el-monoton el-polyton en-gb en-us
       hi hr hsb hu hy ia id is it ka kmr kn la la-x-classic la-x-liturgic
       lt lv ml mn-cyrl mr mul-ethi nb nl nn oc or pa pl pms pt rm ro ru
       sa sh-cyrl sh-latn sk sl sr-cyrl sv ta te th tk tr uk zh-latn-pinyin)
  LNK="ftp://ftp.ctan.org/tex-archive/language/hyph-utf8/tex/generic/hyph-utf8/patterns/txt/"
  for i in "${LNG[@]}"; do
    echo "Language: $i"
    for j in "pat.txt" "hyp.txt" "chr.txt"; do
      curl -f -o hyph/hyph-${i}.$j ${LNK}hyph-${i}.$j
    done
  done
}

package() {
  cd $srcdir/hyph
  mkdir -p "$pkgdir/$HYPH"
  cp -a * "$pkgdir/$HYPH"

  ## copy hyphenation macro file
  mkdir -p "$pkgdir/$MDIR"
  install -m644 $srcdir/tmac.hyph $pkgdir/$MDIR/tmac.hyph
}

