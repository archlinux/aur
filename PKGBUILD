# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Tarn Burton <twburton at gmail dot com>

pkgname='quex'
pkgver=0.69.3
pkgrel=1
pkgdesc="Generator of lexical analyzers in C and C++. Unicode Supported."
arch=('any')
url="http://quex.org/"
license=('LGPL')
provides=('quex' 'quex-for_libadalang')
depends=('python2')
source=("https://downloads.sourceforge.net/quex/quex-$pkgver.tar.gz")
sha256sums=('ad0fbb6bef8116ac312d6ab9e93b444ca5826f9c683a6dae1c1f606cf7e78fcf')

package() {
mkdir -p "${pkgdir}/usr/lib"
mkdir -p "${pkgdir}/usr/bin"

cp -rf "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/lib"

sed -s "s|#! /usr/bin/env python|#! /usr/bin/env python2|g" -i "${pkgdir}/usr/lib/${pkgname}-${pkgver}/quex-exe.py"

# Install profile.d script to set QUEX_PATH.
#
mkdir -p "${pkgdir}"/etc/profile.d
echo "export QUEX_PATH=/usr/lib/${pkgname}-${pkgver}" > "${pkgdir}"/etc/profile.d/quex.sh

ln -s "/usr/lib/${pkgname}-${pkgver}/quex-exe.py" "${pkgdir}/usr/bin/quex"

chmod 755 "${pkgdir}/usr/lib/${pkgname}-${pkgver}/quex-exe.py"
}
