# Maintainer: Andy Kluger <https://t.me/andykluger>
# Contributor: Markus Weimar <mail@markusweimar.de>
_pkgname=ttf-iosevka
pkgname=${_pkgname}-git
pkgver=1702579105
pkgrel=1
pkgdesc='A slender monospace sans-serif and slab-serif typeface inspired by Pragmata Pro, M+ and PF DIN Mono.'
arch=('any')
url='https://be5invis.github.io/Iosevka/'
license=('custom:OFL')
makedepends=('git' 'nodejs>=12.22.0' 'npm' 'ttfautohint')
depends=()
conflicts=(${_pkgname})
provides=(${_pkgname})
source=()
sha256sums=()

prepare () {
  rm -rf Iosevka
  git clone --depth 1 --branch dev 'https://github.com/be5invis/Iosevka'
}

pkgver () {
  cd Iosevka
  git log -1 --format=%ct
}

build () {
  cd Iosevka
  npm install
  npm update
  NO_COLOR=1 npm run build -- ttf::Iosevka
}

package () {
  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 Iosevka/dist/*/TTF/*.ttf "${pkgdir}/usr/share/fonts/TTF/"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 Iosevka/LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/"
}
