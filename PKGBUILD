# Maintainer: RAMChYLD <ramchyld@gmail.com>
# Contributor: Eric Fung <loseurmarbles [at] gmail [dot] com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=dcaenc
pkgver=3
pkgrel=1
pkgdesc='An open-source implementation of the DTS Coherent Acoustics lossy audio codec'
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
url='https://gitlab.com/patrakov/dcaenc'
license=('LGPL')
depends=('alsa-lib')
options=('!libtool')
source=("${url}/-/archive/v3/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('c928071679be586891c06bdd56aaadbef59b2f38c13d54d01a1fb868dee24c10')

build() {
  cd "${pkgname}-v${pkgver}"
  autoreconf -f -i -v
  ./configure --prefix=/usr
  make
}

check() {
  cd "${pkgname}-v${pkgver}"
  make check
}

package() {
  cd "${pkgname}-v${pkgver}"
  make DESTDIR="${pkgdir}/" install

  install -Dm644 AUTHORS "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
  install -Dm644 BUGS "${pkgdir}/usr/share/doc/${pkgname}/BUGS"
  install -Dm644 NEWS "${pkgdir}/usr/share/doc/${pkgname}/NEWS"
  install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim:set ts=2 sw=2 et:
