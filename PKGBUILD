# Maintainer: Filip Parag <aur@filiparag.com>

pkgname=wmrc
pkgver=1.1
pkgrel=5
pkgdesc='WMRC is a shell utility for extending window manager capabilities using modules with dependency and error checking.'
arch=('any')
url='https://github.com/filiparag/wmrc'
license=('MIT')
depends=('dash')
makedepends=('git')
source=('git+https://github.com/filiparag/wmrc.git')
sha1sums=('SKIP')

prepare() {
  cd "${pkgname}"
  git checkout "tags/${pkgver}"
}

package() {
  cd "${pkgname}"
  install -Dm 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -d -m 755 "${pkgdir}/usr/share/${pkgname}"
  install -Dm 644 "rc.conf" "${pkgdir}/usr/share/${pkgname}/"
  install -Dm 644 "usage.txt" "${pkgdir}/usr/share/${pkgname}/"
  install -Dm 644 "wmrc.man" "${pkgdir}/usr/share/man/man1/${pkgname}.${pkgver}"
  cp -r --preserve=mode "modules" "${pkgdir}/usr/share/${pkgname}/"
}