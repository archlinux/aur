# Maintainer: Pi-Yueh Chuang <pychuang@pm.me>
pkgname=python-imaplib2-git
pkgver=r182.11dbeb0
pkgrel=1
pkgdesc="Threaded Python IMAP4 client"
arch=("any")
url="https://github.com/jazzband/imaplib2"
license=("MIT")
depends=("python")
makedepends=("git" "python-setuptools")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+https://github.com/jazzband/imaplib2.git")
md5sums=("SKIP")

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    python setup.py build
}

package() {
    cd "$pkgname"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    # install README
    install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/$pkgname"

    # install LICENSE
    install -Dm644 "LICENCE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
