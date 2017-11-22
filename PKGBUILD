# Maintainer: Subash Aryal <blacpythoz@gmail.com>

pkgname=ttf-nepali-fonts
pkgver=r3.c3f5ee5
pkgrel=1
pkgdesc='A collection of popular Nepali Fonts. Preeti,Himalaya,Kantipur,Sagarmatha etc .'
arch=('any')
url='http://www.nepali.info/nepali/fonts/'
makedepends=('git')
depends=('fontconfig' 'xorg-font-utils')
provides=('ttf-nepali-fonts')
source=("git+https://github.com/blacpythoz/nepali-fonts")
md5sums=('SKIP')

pkgver() {
  cd "nepali-fonts"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 nepali-fonts/fonts/*.ttf "${pkgdir}/usr/share/fonts/TTF/"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 nepali-fonts/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}

post_install() {
    echo -n "Updating font cache... "
    fc-cache >/dev/null -f
    mkfontscale /usr/share/fonts/TTF
    mkfontdir /usr/share/fonts/TTF
    echo done
}

post_upgrade() {
    post_install
}
