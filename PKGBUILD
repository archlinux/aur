# Maintainer: Andy Kluger <AndyKluger@gmail.com>
# Contributor: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-iosevka-git
pkgver=r1461.43a8ca6d
pkgrel=1
pkgdesc='A slender monospace sans-serif and slab-serif typeface inspired by Pragmata Pro, M+ and PF DIN Mono.'
arch=('any')
url='https://be5invis.github.io/Iosevka/'
license=('custom:OFL')
makedepends=('afdko' 'git' 'nodejs' 'npm' 'otfcc' 'ttfautohint')
depends=('fontconfig' 'xorg-font-utils')
conflicts=('ttf-iosevka')
provides=('ttf-iosevka')
source=('git+https://github.com/be5invis/Iosevka')
sha256sums=('SKIP')

pkgver() {
  cd Iosevka
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd Iosevka
  npm install
  npm update
  npm run build -- ttf::iosevka
}

package() {
  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 Iosevka/dist/*/ttf/*.ttf "${pkgdir}/usr/share/fonts/TTF/"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 Iosevka/LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/"
}
