# Maintainer: David Adler <d.adler@posteo.de>

pkgname=gnucap-models
pkgver=20171003
pkgrel=1
pkgdesc="additional device models for Gnucap"
arch=('x86_64')
url="https://git.savannah.gnu.org/cgit/gnucap/gnucap-models.git/"
license=('custom')
depends=('gnucap')
source=("$url/snapshot/$pkgname-$pkgver.tar.gz")
md5sums=('3740c6effcdd953610abeeee3919d372')

prepare() {
    cd $pkgname-$pkgver
    # allow for DESTDIR
    sed -i 's/\(^INSTALL_DIR = \)/\1$(DESTDIR)/' plugins/*/Make2.gcc
}

build() {
    cd $pkgname-$pkgver
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir/" install

    # 4 sets of models with a total of 2 different licenses
    mv plugins/models-bsim/COPYING plugins/models-bsim/COPYING.bsim
    install -t "${pkgdir}/usr/share/licenses/$pkgname/" \
        -vDm 644 plugins/models-{bsim/COPYING.bsim,spice3f5/COPYING}
}

