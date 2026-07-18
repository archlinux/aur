_pkgname=adwifi
pkgname=$_pkgname-git
pkgver=r0.g0000000
pkgrel=1
pkgdesc="A libadwaita Wi-Fi manager backed by iwd"
arch=('any')
url="https://github.com/rzesm/adwifi"
license=('GPL-3.0-or-later')

depends=(
    'python-dbus-next'
    'python-gobject'
    'gtk4'
    'libadwaita'
    'python-cairo'
    'iwd'
    'speedtest-cli'
)

makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-poetry-core'
)

provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 assets/adwifi.desktop -t "$pkgdir/usr/share/applications/"
    install -Dm644 assets/adwifi.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/adwifi.svg"
}
