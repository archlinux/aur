# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Max a.k.a. Synthead <synthead@gmail.com>
# Contributor: christhemonkey <christhemonkey at gmail dot com>

pkgname=raul
pkgver=0.8.0
pkgrel=8
pkgdesc="C++ Realtime Audio Utility Library"
arch=('x86_64')
url="https://drobilla.net/software/raul/"
depends=('glib2')
makedepends=('boost' 'python2')
license=('GPL2')
source=("https://download.drobilla.net/${pkgname}-${pkgver}.tar.bz2"{,.sig}
        'raul-0.8.0-ldconfig.patch')
sha512sums=('7ad48c551945aad104309448bcdb86a4a2ca07c44af53b37492e7cddce6a093529f1e1e75c4b27cb8e292ec46424969cdea270883d44b2f1badc48df8943a0a1'
            'SKIP'
            'db3803fb722e1dc7cc8d8f889415eb001f6785ba3297ad7621c0ccc8099da95c3f300b209f14c5cebc66626a767fe7dd7950c7eae4d3e49c48b6c05db76267d3')
validpgpkeys=('38B6B5874F029137653BF39BC6F60E6529727060')

prepare(){
  cd "${pkgname}-${pkgver}"
  # disable local call to ldconfig
  patch -Np1 -i "${srcdir}/raul-0.8.0-ldconfig.patch"
}

build() {
  cd "${pkgname}-${pkgver}"
  python2 waf configure --prefix=/usr
  python2 waf build
}

package() {
  cd "${pkgname}-${pkgver}"
  python2 waf install --destdir="${pkgdir}"
  install -t "${pkgdir}/usr/share/doc/${pkgname}/" \
    -vDm644 {AUTHORS,ChangeLog,README}
}
