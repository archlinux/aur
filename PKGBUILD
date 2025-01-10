# Maintainer: Kainoa Kanter <kainoa@t1c.dev> 
# Original author: Johannes Willem (Hans) Fernhout <hfern@fernhout.info>
pkgname="iwdgui"
pkgver="0.3.0"
pkgrel=3
pkgdesc="A graphical frontend for IWD, Intel's iNet Wireless Daemon"
arch=("any")
url="https://gitlab.com/hfernh/iwdgui"
license=("BSD")
depends=("python>=3.10" "python-gobject" "gtk3" "python-netifaces" "dbus-python")
makedepends=('python-setuptools' 'python-pip' 'python-build')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('fd4f02a778d2edf3f9d6552744a5d2427fb45f78ff0ed8eb15654b5fdb2a3ef2')

build() {
    cd  "${pkgname}-${pkgver}"
    python -m build
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m pip install --root="$pkgdir" --no-deps --ignore-installed .
    install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
