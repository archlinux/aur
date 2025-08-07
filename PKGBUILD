# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="libideviceactivation"
pkgver=1.1.1
pkgrel=1
pkgdesc="A library to handle the activation process of iOS devices"
arch=('x86_64')
url="https://github.com/libimobiledevice/${pkgname}"
license=('LGPL-2.1-or-later' 'GPL-3.0-or-later')
depends=('curl>=7.20' 'glibc' 'libimobiledevice>=1.3.0' 'libplist>=2.2.0' 'libxml2>=2.9')
provides=("${pkgname}-1.0.so")
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('522fa23e508bffe878a77b2ca0afe15f62f4142331d9d3a64b380fb1e2dafab6b5e9ac21b5b52434b40d18402114a38a7c94ced592b9aea63d22df74596ea8fb')

build() {
  local configure_options=(
    --prefix='/usr'
  )
  
  cd "${srcdir}/${_pkgsrc}"
  autoreconf -vfi
  ./configure "${configure_options[@]}"
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  install -vDm644 "NEWS"        "${pkgdir}/usr/share/doc/${pkgname}/NEWS"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "COPYING"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
