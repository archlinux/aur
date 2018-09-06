# Maintainer: Ainola
# Contributor: Michael Herold

pkgname=scudcloud
pkgver=1.65
pkgrel=3
epoch=2
pkgdesc="A Slack client for Linux"
arch=('any')
url="https://github.com/raelgc/scudcloud"
license=('MIT')
depends=('libnotify' 'python-setuptools' 'python-dbus' 'python-gobject'
         'python-pyqt5' 'qt5-webkit')
makedepends=('python-jsmin')
groups=('messaging')
source=("https://github.com/raelgc/scudcloud/archive/v${pkgver}.tar.gz")
sha256sums=('1b5420a868a37e181655e9799a3d1fcbbc0b0112349c44ac3d7936b626334791')

prepare() {
    # We don't need the Ubuntu-specific icons
    sed -i "s;'ubuntu-mono-.*light', ;;g" "$pkgname-$pkgver"/setup.py
}

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
