# Maintainer: Suphal Bhattarai suphalbhattarai4@gmail.com
pkgname=ttf-nepali-font-git
pkgver=1.0.1
pkgrel=1
pkgdesc="Collection Of Pupular Nepali Fonts"
arch=(x86_64 i686)
url="https://gitlab.com/Suphal/ttf-nepali-font-git.git"
depends=(fontconfig)
makedepends=(git )
provides=(ttf-nepali-font-git)
source=("git+https://gitlab.com/Suphal/ttf-nepali-font-git.git")

md5sums=('SKIP')

pkgver() {
  cd "ttf-nepali-font-git"
  install -d "${pkgdir}/usr/share/fonts/TTF"
  printf "1.0.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 ttf-nepali-font-git/fonts/*.ttf "${pkgdir}/usr/share/fonts/TTF/"
}

post_install() {
    echo -n "Updating font cache... "
    fc-cache >/dev/null -f
    mkfontscale /usr/share/fonts/TTF
    mkfontdir /usr/share/fonts/TTF
    echo done
}
