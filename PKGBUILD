# Maintainer: Gustaf Lindstedt <gustaflindstedt at protonmail dot com>

pkgname=xwobf-git
pkgver=0.r17.4ff96e3
pkgrel=1
pkgdesc='Generates a screenshot which obfuscates all X windows.'
arch=('any')
url='https://github.com/glindstedt/xwobf'
license=('MIT')
depends=('xorg-server' 'libxcb' 'imagemagick')
makedepends=('git' 'libxcb' 'imagemagick')
source=("${pkgname}::git://github.com/glindstedt/xwobf.git")
provides=("xwobf=${pkgver}")
conflicts=('xwobf')
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" \
                    "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}/" install

  # install LICENSE
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
