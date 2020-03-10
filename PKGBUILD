# Maintainer: Adrian Freund <adrian@freund.io>

pkgname=python-spotpris2
_module=SpotPRIS2
pkgver=0.4.1
pkgrel=1
pkgdesc="Control Spotify Connect devices using MPRIS2"
url="https://github.com/freundTech/SpotPRIS2"
depends=('python' 'python-pydbus' 'python-spotipy' 'python-appdirs' 'python-gobject' 'glib2')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://github.com/freundTech/SpotPRIS2/archive/v${pkgver}.tar.gz")
sha256sums=('c2d621c28404a28067e119c79ca38b1a4afb174f3ff432243eff36406c475f5f')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm 644 contrib/spotpris2.service "${pkgdir}/usr/lib/systemd/user/spotpris2.service"
}
