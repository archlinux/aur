# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Michael Lass <bevan@bi-co.net>
# Contributor: jospehgbr <rafael.f.f1@gmail.com>
# Contributor: coderoar <coderoar@gmail.com>
# Contributor: webjdm <web.jdm@gmail.com>

_pkgbase=popt
pkgname=lib32-${_pkgbase}
pkgver=1.18
pkgrel=1
pkgdesc="Commandline option parser (32 bit)"
arch=('x86_64')
url="http://rpm5.org"
license=('custom')
depends=('lib32-glibc' "${_pkgbase}")
source=(https://ftp.osuosl.org/pub/rpm/popt/releases/popt-1.x/popt-${pkgver}.tar.gz)
sha256sums=('5159bc03a20b28ce363aa96765f37df99ea4d8850b1ece17d1e6ad5c24fdc5d1')

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
