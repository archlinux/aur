# Maintainer: A Farzat <a@farzat.xyz>

pkgname=tg-archive-git
_pkgname=tg-archive
pkgver=0.5.4.r12.g3224022
pkgrel=1
pkgdesc='A tool for exporting Telegram group chats into static websites to preserve chat history like mailing list archives.'
arch=(any)
url=https://github.com/knadh/tg-archive
license=('MIT')
depends=(python python-cryptg python-feedgen python-jinja python-pillow python-yaml python-telethon python-magic)
makedepends=(git python-setuptools)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/knadh/tg-archive.git")
md5sums=(SKIP)

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cp "$srcdir/$_pkgname/LICENSE" "$srcdir"
}

build() {
    cd "$srcdir/$_pkgname"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname"
    python setup.py install --optimize=1 --root="$pkgdir" --skip-build
    install -D -m644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
