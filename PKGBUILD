# Maintainer: Andy Kluger <AndyKluger@gmail.com>
# Contributor: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-iosevka-custom-git
pkgver=r886.2477121
pkgrel=1
pkgdesc='A slender monospace sans-serif and slab-serif typeface inspired by Pragmata Pro, M+ and PF DIN Mono.'
arch=('any')
url='https://be5invis.github.io/Iosevka/'
license=('custom:OFL')
makedepends=('git' 'nodejs' 'npm' 'ttfautohint' 'otfcc')
depends=('fontconfig' 'xorg-font-utils')
conflicts=('ttf-iosevka-hooky' 'ttf-iosevka-zshaped' 'ttf-iosevka')
provides=('ttf-iosevka')
source=("git+https://github.com/be5invis/Iosevka")
md5sums=('SKIP')

pkgver() {
  cd "Iosevka"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd Iosevka
  npm install
  make custom-config design='v-l-tailed v-i-hooky v-g-opendoublestorey v-m-shortleg v-zero-dotted'
  make custom
}

package() {
  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 Iosevka/dist/*/*.ttf "${pkgdir}/usr/share/fonts/TTF/"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 Iosevka/LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/"
}

# letter l:
#     v-l-hooky : Hooky l.
#     v-l-zshaped : Z-shaped l.
#     v-l-serifed : Serifed l (default for upright and oblique).
#     v-l-italic : Italic l (default for italic).
#     v-l-tailed : l with a curved tail.
#     v-l-hookybottom : l with a straight tail.
# letter i:
#     v-i-hooky : Hooky i.
#     v-i-zshaped : Z-shaped i.
#     v-i-serifed : Serifed i (default for upright and oblique).
#     v-i-italic : Italic i (default for italic).
# letter a:
#     v-a-doublestorey : Double-storey a (default for upright and oblique).
#     v-a-singlestorey : Single-storey a (default for italic).
# letter g:
#     v-g-doublestorey : Double-storey g (default).
#     v-g-singlestorey : Single-storey g.
#     v-g-opendoublestorey : Open Single-storey g.
# letter m:
#     v-m-longleg : m with long middle leg (default).
#     v-m-shortleg : m with shorter middle leg.
# letter 0:
#     v-zero-slashed : Slashed Zero 0 (default).
#     v-zero-dotted : Dotted Zero 0.
#     v-zero-unslashed : O-like 0.
# ASCII tilde (~), asterisk (*), paragaraph(¶), and ASCII Caret (^):
#     v-tilde-high : Higher tilde ~.
#     v-tilde-low : Lower tilde ~ (default).
#     v-asterisk-high : Higher asterisk * (default).
#     v-asterisk-low : Lower asterisk *.
#     v-paragraph-high : Higher paragraph symbol ¶ (default).
#     v-paragraph-low : Lower paragraph symbol ¶.
#     v-caret-high : Higher circumflex ^ (default).
#     v-caret-low : Lower circumflex ^.
# At (@):
#     v-at-long : The long, three-fold At symbol in Iosevka 1.7.x.
#     v-at-fourfold : The traditional, four-fold At symbol.
#     v-at-short : The shorter, Fira-like At symbol introduced in Iosevka 1.8.
# Eszet(ß)
#     v-eszet-traditional : Tratidional, Fraktur-like Eszet.
#     v-eszet-sulzbacher : A more modern, beta-like Eszet (default).
# curly brackets ({})
#     v-brace-straight : More straight braces.
#     v-brace-curly : More curly braces (default).
