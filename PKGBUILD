pkgname=mcg
pkgver=1.0
pkgrel=2
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
sha256sums=('5e2952f1685c3006c3278551e439399a8caea2224855f82b8adf8642d93c0424')


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
