# Maintainer: Arda Demir <ardadem.dev@gmail.com>
pkgname=a4tech-bloody-driver-git
_pkgname=a4tech-bloody-driver
pkgver=r16.ae33367
pkgrel=1
pkgdesc='Linux driver for a4tech bloody mouse series.'
arch=('any')
url='https://github.com/maxmati/a4tech-bloody-linux-driver'
license=('unknown')
makedepends=('git' 'cmake')
provides=('a4tech-bloody-driver')
conflicts=('a4tech-bloody-driver')
source=($pkgname::git+https://github.com/maxmati/a4tech-bloody-linux-driver
        '60-bloody.rules')
md5sums=('SKIP'
         'SKIP')

build() {
  cd "${srcdir}/${pkgname}"

  cmake ./
  make
}

package() {
  mkdir -p "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/usr/lib/udev/rules.d/"

  install -Dm755 "${srcdir}/${pkgname}/bloody" "${pkgdir}/usr/bin/"
  chmod +x "${pkgdir}/usr/bin/bloody"

  install -Dm644 "${srcdir}/60-bloody.rules" "${pkgdir}/usr/lib/udev/rules.d/"
}
