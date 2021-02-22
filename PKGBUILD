# Maintainer: Johannes Willem (Hans) Fernhout <hfern@fernhout.info>
pkgname="krapplet"
pkgver="0.3.1"
pkgrel=1
pkgdesc="A graphical password manager for Linux using gnome-keyring or GPG"
arch=("any")
url="https://gitlab.com/hfernh/krapplet"
license=("BSD")
depends=("python-gobject" "gtk3")
optdepends=("python-secretstorage: gnome-keyring as storage provider"
            "python-gnupg: a pass compatible storage provicer based on GPG")
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=("41989cdde07d5b2637d508e5d7d4eaeaebdd376ed04f19f66980125725a6b622")
build() {
    cd  "${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

