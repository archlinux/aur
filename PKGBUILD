# Maintainer: sseneca <sm0@tuta.io>

pkgname=scream-alsa
pkgver=3.4
pkgrel=1
pkgdesc='A scream receiver using alsa as audio output'
arch=('x86_64')
provides=('scream-ivshmem-alsa')
depends=('alsa-lib')
url='https://github.com/duncanthrax/scream'
license=('custom:MS-PL')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('1f24ce794d07eb77579044f3e34454315dfbf8332741c69e1f58aae6982f84f4')

build() {
  cd "${srcdir}/scream-${pkgver}/Receivers/alsa"
  make

  cd "${srcdir}/scream-${pkgver}/Receivers/alsa-ivshmem"
  make
}

package() {
  cd "${srcdir}/scream-${pkgver}/Receivers"
  install -d "${pkgdir}/usr/bin"
  install alsa/scream-alsa "${pkgdir}/usr/bin" 
  install alsa-ivshmem/scream-ivshmem-alsa "${pkgdir}/usr/bin" 

  cd "${srcdir}/scream-${pkgver}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
