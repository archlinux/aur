pkgname=mcg
pkgver=1.0rc1
pkgrel=1
pkgdesc="A covergrid for the Music Player Daemon."
url="https://www.coderkun.de/codes/mcg"
arch=(any)
license=(GPL)
depends=('python-gobject' 'gtk3' 'gsettings-desktop-schemas' 'desktop-file-utils')
optdepends=('python-keyring' 'avahi')
makedepends=('python-setuptools' 'git')
provides=("$pkgname")
conflicts=("$pkgname")
source=("${pkgname}.tar.gz::https://github.com/coderkun/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('69556842d3fc84365c2d85188ee25f0b5c1aa3b9ee5f0ae5365a102930bbb468')


build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    python setup.py --no-compile-schemas build
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    python setup.py --no-compile-schemas \
        install --root="$pkgdir/" --prefix=/usr --optimize=1
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
