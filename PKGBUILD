# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Moritz Patelscheck <moritz(at)patelscheck.de>

pkgname=ardesia
pkgver=1.1
pkgrel=2
pkgdesc='Tool for drawing on the screen of a X11 session'
arch=('x86_64')
url='https://code.google.com/archive/p/ardesia/'
depends=('gtk3' 'cairo' 'gdk-pixbuf2' 'glib2' 'gsl' 'libgsf' 'libxml2')
makedepends=('intltool' 'xdg-utils')
license=('GPL3')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/ardesia/${pkgname}-${pkgver}.tar.gz"
        '010-ardesia-gcc10-fix.patch')
sha256sums=('b65e0153f5239c270bb1734d1cd257738339ba163081509ee42499da8dd6ee18'
            '212984a4d9c8654f2e111125e6034bbf06f0d687f110f3b5451789119af34fc9')

prepare() {
    patch -d "${pkgname}-${pkgver}" -Np1 -i "${srcdir}/010-ardesia-gcc10-fix.patch"
}

build() {
    cd "${pkgname}-${pkgver}"
    ./configure
    make
}

package() {
    make -C "${pkgname}-${pkgver}" DESTDIR="$pkgdir" install
}
