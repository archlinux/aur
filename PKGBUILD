# Maintainer: Suphal Bhattarai suphalbhattarai4@gmail.com
pkgname=ttf-nepali-font-git
pkgver=r6.e645fa5
pkgrel=1
pkgdesc="Collection Of Pupular Nepali Fonts"
arch=(x86_64 i686)
url="git+https://github.com/SuphalBhattarai/nepali-fonts"
depends=(fontconfig)
makedepends=(git )
provides=(ttf-nepali-font-git)
source=("git+https://github.com/SuphalBhattarai/nepali-fonts")
md5sums=('SKIP')

pkgver() {
  cd "nepali-fonts"
  install -d "${pkgdir}/usr/share/fonts/TTF"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 nepali-fonts/fonts/*.ttf "${pkgdir}/usr/share/fonts/TTF/"
}

post_install() {
    echo -n "Updating font cache... "
    fc-cache >/dev/null -f
    mkfontscale /usr/share/fonts/TTF
    mkfontdir /usr/share/fonts/TTF
    echo done
}
