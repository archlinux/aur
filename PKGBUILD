# Maintainer: noprobelm@protonmail.com
pkgname=nay
pkgver=0.1.r21.5877980
pkgrel=1
pkgdesc="A wrapper for pacman extended to support AUR packages"
arch=(any)
url="https://github.com/noprobelm/nay.git"
license=('MIT')
groups=()
depends=(python-rich python-requests pyalpm)
makedepends=(git python-{build,installer,poetry-core,wheel})
optdepends=()
provides=(nay)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname"::"git+$url")
noextract=()
md5sums=('SKIP') #autofill using updpkgsums

pkgver() {
    cd "$pkgname"
    printf "0.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd nay 
    /usr/bin/python3 -m build --wheel --no-isolation
}

package() {
    cd nay
    /usr/bin/python3 -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
