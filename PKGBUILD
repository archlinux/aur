# vim: set ts=8 sw=8 expandtab:
#
# Maintainer: m4dz <code@m4dz.net>
_gitname=Projecteur
pkgname=projecteur
pkgver=0.7
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
source=("https://github.com/jahnf/Projecteur/archive/v$pkgver.tar.gz"
        "projecteur.install")
sha256sums=('e2582b908c54f3b0f1f66247dd7f24174a40f5764385662b7b70acdeccd03ebc'
            'a8d406a61d84834358aba36718547be20eb6ee1d055c4ffdb28fe9f56d22aaaf')

prepare() {
        mkdir -p "$srcdir/build"
        cd "$srcdir/build"
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr "$srcdir/$_gitname-$pkgver"
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
        install -D -m644 "$srcdir/$_gitname-$pkgver/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
