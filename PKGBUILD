pkgname=mcg
pkgver=3.0.1
pkgrel=1
pkgdesc="A covergrid for the Music Player Daemon."
url="https://www.suruatoel.xyz/codes/mcg"
arch=(any)
license=(GPL)
depends=('python-gobject' 'gtk3>=3.22' 'gsettings-desktop-schemas' 'desktop-file-utils')
optdepends=('python-keyring' 'avahi' 'mpd>=0.21')
makedepends=('python-setuptools' 'git')
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://gitlab.com/coderkun/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('8d9c7ca950fe607905015f479a1ce49d997f8fd955b259cea14fd6e10dc5fd95')


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
