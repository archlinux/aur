# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Geoffroy Carrier <geoffroy@archlinux.org>
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>

pkgname=libxerces-c-3.1
_pkgname=xerces-c
pkgver=3.1.4
pkgrel=1
pkgdesc="A validating XML parser written in a portable subset of C++"
arch=('i686' 'x86_64')
url="http://xerces.apache.org/xerces-c/"
license=('APACHE')
depends=('gcc-libs' 'curl' 'icu')
conflicts=('xerces-c<3.2')
source=("https://archive.apache.org/dist/xerces/c/3/sources/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('c98eedac4cf8a73b09366ad349cb3ef30640e7a3089d360d40a3dde93f66ecf6')

build() {
  cd "${_pkgname}-${pkgver}"

  [[ "${CARCH}" = "i686" ]] && SSE2="--disable-sse2"
  ./configure --prefix=/usr --sysconfdir=/etc ${SSE2}
  make
  if [ -d build ]
  then
    rm -rf "./build"
  fi
  make DESTDIR="${srcdir}/build" install
}

package() {
  install -m 755 -d "${pkgdir}/usr/lib"
  install -m 755 -t "${pkgdir}/usr/lib" "${srcdir}/build/usr/lib/${pkgname}.so"
}
