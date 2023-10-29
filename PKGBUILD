# Maintainer: dosssman <dosssman@hotmail.fr>
# Contributer: m4dz <code@m4dz.net>

pkgname=projecteur
pkgver=0.10
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
sha256sums=('1eb12cd3326d039ee979f95fe3689f1376ca08b80b2ddb338e4de73f24c281f2'
            'a8d406a61d84834358aba36718547be20eb6ee1d055c4ffdb28fe9f56d22aaaf')

prepare() {
	mkdir -p "$srcdir/build"
        cd "$srcdir/build"
        cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DPROJECTEUR_QT_VERSION:STRING="5" "$srcdir/$pkgname-$pkgver"
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
