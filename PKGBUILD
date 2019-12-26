# Maintainer: fatalis <fatalis@fatalis.pw>
pkgname=scream-pulse
pkgver=3.4
pkgrel=2
pkgdesc='A scream receiver using pulseaudio as audio output'
arch=('x86_64')
provides=('scream-ivshmem-pulse')
depends=('libpulse')
url='https://github.com/duncanthrax/scream'
license=('custom:MS-PL')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('1f24ce794d07eb77579044f3e34454315dfbf8332741c69e1f58aae6982f84f4')

build() {
  cd "${srcdir}/scream-${pkgver}/Receivers/pulseaudio"
  make

  cd "${srcdir}/scream-${pkgver}/Receivers/pulseaudio-ivshmem"
  make
}

package() {
  cd "${srcdir}/scream-${pkgver}/Receivers"
  install -d "${pkgdir}/usr/bin"
  install pulseaudio/scream-pulse "${pkgdir}/usr/bin" 
  install pulseaudio-ivshmem/scream-ivshmem-pulse "${pkgdir}/usr/bin" 

  cd "${srcdir}/scream-${pkgver}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
