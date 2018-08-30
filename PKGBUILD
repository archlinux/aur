# Maintainer: Lon Sagisawa <me(at)mlny.info>
_reponame=Cica
pkgname=ttf-cica-git
pkgver=v3.0.0.r4.g58ac972
pkgrel=1
pkgdesc='Composite Japanese font for coding. Mixed Ubuntu Mono, Rounded Mgen+, Nerd Fonts and Noto Emoji.'
arch=('any')
url='https://github.com/miiton/Cica'
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('git' 'docker' 'docker-compose')
provides=('ttf-cica')
install=${pkgname}.install
source=(${_reponame}::git+${url}.git)
md5sums=('SKIP')

pkgver() {
  git -C "${_reponame}" describe --long --tags | sed "s/-/.r/;s/-/./g"
}

build() {
  cd ${srcdir}/Cica
  sudo docker-compose up
  sudo docker-compose down
}

package() {
  cd ${srcdir}/Cica
  install -d ${pkgdir}/usr/share/fonts/TTF
  install -m644 ./dist/*.ttf ${pkgdir}/usr/share/fonts/TTF/
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
}
