# Maintainer: Evilchuck666 <carlos.martinez.medina1992@gmail.com>
_pkgname=SabreBat
pkgname=sabrebat
pkgver=0.1.0
pkgrel=1
pkgdesc="Battery level of the Corsair Sabre v2 Pro wireless mouse: terminal, status bar or desktop notification"
arch=('any')
url="https://github.com/Evilchuck666/SabreBat"
license=('GPL-3.0-only')
depends=('python' 'libnotify' 'hicolor-icon-theme')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$_pkgname::git+https://github.com/Evilchuck666/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    python -c "import tomllib; print(tomllib.load(open('pyproject.toml','rb'))['project']['version'])"
}

build() {
    cd "$_pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 data/70-sabrebat.rules "$pkgdir/usr/lib/udev/rules.d/70-sabrebat.rules"
    install -Dm644 data/sabre-bat.desktop "$pkgdir/usr/share/applications/sabre-bat.desktop"
    install -Dm644 data/sabrebat.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/sabrebat.svg"
}
