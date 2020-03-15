pkgname=mcg
pkgver=2.0.2
pkgrel=1
pkgdesc="A covergrid for the Music Player Daemon."
url="https://www.suruatoel.xyz/codes/mcg"
arch=(any)
license=(GPL)
depends=('python-gobject' 'gtk3' 'gsettings-desktop-schemas' 'desktop-file-utils')
optdepends=('python-keyring' 'avahi')
makedepends=('python-setuptools' 'git')
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://gitlab.com/coderkun/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('148f89cb2d49f1910086cabb0420d866185f285b2ad51a34953735b327ea8e2c')


build() {
    cd "$srcdir/${pkgname}-v${pkgver}"
    python setup.py --no-compile-schemas build
}

package() {
    cd "$srcdir/${pkgname}-v${pkgver}"
    python setup.py --no-compile-schemas \
        install --root="$pkgdir/" --prefix=/usr --optimize=1
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
