# Maintainer: Martin Rys <rys.pw/contact>

pkgname=nodejs-fontmin
_pkgname=${pkgname#nodejs-}
pkgver=1.0.1
pkgrel=1
pkgdesc="Font converter/Optimizer"
url="https://github.com/ecomfe/fontmin"
arch=('x86_64')
license=('MIT')
depends=('gcc-libs' 'nodejs' 'python')
makedepends=('npm')
#noextract=("${_pkgname}-${pkgver}.tgz")
source=(
"https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz"
"${pkgname}-110.patch")
sha256sums=('e56958e932fe1de624802f3d29957be6227272eabf16c48a60b68fc8651a3f89'
            '3191468b52b5261f47ea9adc74b9754c512b52801564a32b6bae5d7cf5cc0269')

#prepare() {
##	ls -lah $srcdir/package
##        cd "$srcdir/${_pkgname}-$pkgver"
#	cd ${srcdir}/package
#        patch -p1 < "$srcdir/110.patch"
#}

package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tgz"

    # This should be in prepare() but I have no clue how to do it properly without having to repack to .tgz
    cd "${pkgdir}/usr/lib/node_modules/fontmin"
    patch -p1 < "$srcdir/${pkgname}-110.patch"
    ln -sf ../lib/node_modules/fontmin/cli.mjs "${pkgdir}/usr/bin/fontmin"
}
