# Contributor: orumin <dev@orum.in>

pkgname=ttf-kazesawa-git
_gitname=kazesawa
pkgver=alpha.v1.r15.g3789e6d
pkgrel=2
pkgdesc="Japanese TrueType font obtained by mixing M+ and Source Sans Pro"
arch=('any')
url="http://kazesawa.github.io/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('fontforge')
source=('git+https://github.com/kazesawa/kazesawa.git')
md5sums=('SKIP')
install=ttf.install

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_gitname}"
  make fetch_deps
  make ttf
}


package() {
    cd "${srcdir}/${_gitname}"

    install -dm755 "${pkgdir}/usr/share/fonts/TTF"
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"

    install -m644 ./out/*.ttf "${pkgdir}/usr/share/fonts/TTF"
    install -m644 ./LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}"
}
