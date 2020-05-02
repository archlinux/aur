# Maintainer: Felipe Balbi <felipe@balbi.sh>
pkgname=sidreloc
pkgver=1.0
pkgrel=1
pkgdesc="SID Tunes Relocation Tool"
arch=('x86_64')
url="https://www.linusakesson.net/software/sidreloc/index.php"
license=('MIT')
depends=('gcc'
	 'make')
source=("https://hd0.linusakesson.net/files/${pkgname}-${pkgver}.tgz")
sha256sums=('8ca55fb4886bda2a499f837e2f9ffd0a4b7217ee7bb1907ceed9e87ef6157bf6')

prepare() {
  tar -zxf "sidreloc-1.0.tgz"
}

build() {
  make -C "${srcdir}"/"${pkgname}-${pkgver}"
  gzip "${srcdir}"/"${pkgname}-${pkgver}"/sidreloc.1
}

package() {
  mkdir -p "${pkgdir}"/usr/bin
  mkdir -p "${pkgdir}"/usr/share/man/man1

  install -Dm755 "${srcdir}"/"${pkgname}-${pkgver}"/sidreloc "${pkgdir}"/usr/bin/sidreloc
  install -g 0 -o 0 -Dm644 "${srcdir}"/"${pkgname}-${pkgver}"/sidreloc.1.gz "${pkgdir}"/usr/share/man/man1/
}
