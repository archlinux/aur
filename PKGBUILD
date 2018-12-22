pkgname=mcg
pkgver=2.0
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
sha256sums=('eb420432630bc0f1d284118934f0b280f7bbce262d8aa52d03a4e20c4b288975')


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
