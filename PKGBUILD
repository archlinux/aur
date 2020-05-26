# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Tarn Burton <twburton at gmail dot com>

pkgname=quex
pkgver=0.71.0
pkgrel=1
pkgdesc="Generator of lexical analyzers in C and C++. Unicode Supported."
arch=('any')
url="http://quex.org/"
license=('LGPL')
provides=('quex' 'quex-for_libadalang')
depends=('python')
source=("https://downloads.sourceforge.net/quex/quex-${pkgver}.zip")
sha256sums=('2e8df936f1daea1367f58aabea92e05136f439eea3cd6cbea96c6af1969e4901')

package() {
  mkdir -p "${pkgdir}/usr/lib"
  mkdir -p "${pkgdir}/usr/bin"

  cp -rf "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/lib"

  # No longer needed as of version 0.71.0
  # sed -s "s|#! /usr/bin/env python|#! /usr/bin/env python2|g" -i "${pkgdir}/usr/lib/${pkgname}-${pkgver}/quex-exe.py"

  # Install profile.d script to set QUEX_PATH.

  mkdir -p "${pkgdir}"/etc/profile.d
  echo "export QUEX_PATH=/usr/lib/${pkgname}-${pkgver}" > "${pkgdir}"/etc/profile.d/quex.sh

  chmod 755 "${pkgdir}/usr/lib/${pkgname}-${pkgver}/quex-exe.py"
  ln -s "/usr/lib/${pkgname}-${pkgver}/quex-exe.py" "${pkgdir}/usr/bin/quex"
}
