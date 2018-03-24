pkgname=mcg
pkgver=1.3.2
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
sha256sums=('e7387f344ee0e1a346aff9c7023a5715c8e5425ca08bbc64e03a3807fc2f2b05')


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
