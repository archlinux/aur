# vim: set ts=8 sw=8 expandtab:
#
# Maintainer: m4dz <code@m4dz.net>
pkgname=projecteur
pkgver=0.8
pkgrel=1
pkgdesc="Linux Desktop Application for the Logitech Spotlight device."
arch=('x86_64')
url="https://github.com/jahnf/Projecteur"
license=('MIT')
depends=('qt5-graphicaleffects>=5.7' 'udev')
install='projecteur.install'
makedepends=('cmake' 'make')
provides=('projecteur')
conflicts=('projecteur-git')
source=("https://github.com/jahnf/Projecteur/releases/download/v${pkgver}/projecteur-${pkgver}_source.tar.gz"
        "projecteur.install")
sha256sums=('bc0439f6279db269e319d6f0634331d382e9d520fc17a9c76e3cb34bd9abc10f'
            'a8d406a61d84834358aba36718547be20eb6ee1d055c4ffdb28fe9f56d22aaaf')

prepare() {
        mkdir -p "$srcdir/build"
        cd "$srcdir/build"
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr "$srcdir/$pkgname-$pkgver"
}

build() {
        cd "$srcdir/build"
        make
}

package() {
        # PKG
        cd "$srcdir/build"
        make DESTDIR="$pkgdir/" install

        # LICENSE
        install -D -m644 "$srcdir/$pkgname-$pkgver/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
