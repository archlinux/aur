# Maintainer: Ryan Delaney <ryan dot patrick dot delaney at proton dot me>
# Contributor: Chris Simons < chris at simonsmail dot net >

pkgname=("protonfixes")
pkgver="1.0.15"
pkgrel="4"
pkgdesc="A module for applying fixes at runtime to unsupported games with Steam Proton without changing game installation files"
arch=("any")
url="https://github.com/simons-public/protonfixes"
license=("BSD")
makedepends=("python-setuptools")
optdepends=('wine: win32 proton prefix support'
            'winetricks: winetricks support'
            'python-cef: splash dialog support'
            'zenity: splash dialog support')
source=("https://github.com/simons-public/protonfixes/archive/$pkgver.tar.gz")
md5sums=('249eecc55572fc072ffc6f37017bb80e')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    rm -r ${pkgdir}/usr/lib/python*/site-packages/tests
}
