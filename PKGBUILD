pkgname=mcg
pkgver=1.2.2
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
sha256sums=('356e4aebd4a278b770e052aac0d68f19c2842cb6c4c6ef09ca6012f551679efe')


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
