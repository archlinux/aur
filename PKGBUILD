pkgname=mcg
pkgver=1.2
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
sha256sums=('df3c533ed6a95d8c01ad2ee3f560b32d1cd3b0d614dd607b60b79e033d7acb00')


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
