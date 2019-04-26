# Maintainer: fatalis <fatalis@fatalis.pw>
pkgname=scream-pulse
pkgver=3.1
pkgrel=1
pkgdesc='A scream receiver using pulseaudio as audio output'
arch=('x86_64')
provides=('scream-ivshmem-pulse')
depends=('pulseaudio')
url='https://github.com/duncanthrax/scream'
license=('custom:MS-PL')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('ab2daabd0d42c5150b5c9cfcc7db2646b9b756d451d21272260258c215b038df')

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
