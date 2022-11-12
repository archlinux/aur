# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Michael Lass <bevan@bi-co.net>
# Contributor: jospehgbr <rafael.f.f1@gmail.com>
# Contributor: coderoar <coderoar@gmail.com>
# Contributor: webjdm <web.jdm@gmail.com>

_pkgbase=popt
pkgname=lib32-${_pkgbase}
pkgver=1.19
pkgrel=1
pkgdesc="Commandline option parser (32 bit)"
arch=('x86_64')
url="http://rpm5.org"
license=('custom')
depends=('lib32-glibc' "${_pkgbase}")
source=(https://ftp.osuosl.org/pub/rpm/popt/releases/popt-1.x/popt-${pkgver}.tar.gz)
sha256sums=('c25a4838fc8e4c1c8aacb8bd620edb3084a3d63bf8987fdad3ca2758c63240f9')

build() {
  export CC="gcc -m32"

  cd ${_pkgbase}-${pkgver}
  ./configure --prefix=/usr --libdir=/usr/lib32 --disable-nls
  make
}

package() {
  cd ${_pkgbase}-${pkgver}
  make DESTDIR="${pkgdir}" pkgconfigdir='/usr/lib32/pkgconfig' install

  rm -rf "${pkgdir}"/usr/{include,share}
  install -dm755 "${pkgdir}"/usr/share/licenses
  ln -s ${_pkgbase} "${pkgdir}"/usr/share/licenses/${pkgname}
}
