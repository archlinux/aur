# Maintainer: William Turner <willtur.will@gmail.com>
pkgname=ttf-dejavu-sans-code-git
pkgver=1.2.r0.b244a9c
pkgrel=1
pkgdesc='Monospaced font with programming ligatures based on DejaVu Sans Mono'
arch=('any')
url='https://github.com/SSNikolaevich/DejaVuSansCode'
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('git' 'fontforge' 'perl-font-ttf')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=fonts.install
source=('git+https://github.com/SSNikolaevich/DejaVuSansCode.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/DejaVuSansCode"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/DejaVuSansCode"
  make full-ttf
}

package() {
  cd "${srcdir}/DejaVuSansCode"
  install -d ${pkgdir}/usr/share/fonts/TTF/
  install -m644 build/*.ttf ${pkgdir}/usr/share/fonts/TTF/
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
