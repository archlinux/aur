# Maintainer: hexchain <i@hexchain.org>

_pkgname=json_delta
pkgbase=python-json-delta
pkgname=(python-json-delta python2-json-delta)
license=("BSD")
pkgver=2.0
pkgrel=1
pkgdesc="A diff/patch pair for JSON-serialized data structures"
url="https://pypi.python.org/pypi/json-delta/"
source=("https://pypi.python.org/packages/d4/82/b61f5ba5f4e09531a80b1a50c251be01f8bdb4997f9fbad077b7572d5ea0/json_delta-2.0.tar.gz")
arch=("any")

build() {
    cd "$srcdir"
    cp -r "$_pkgname-$pkgver" "$_pkgname-$pkgver-py2"
}

package_python-json-delta() {
    depends=("python")
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --prefix=/usr --root="$pkgdir" -O1
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_python2-json-delta() {
    depends=("python2")
    cd "$srcdir/$_pkgname-$pkgver-py2"
    python2 setup.py install --prefix=/usr --root="$pkgdir" -O1
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

    cd "$pkgdir/usr/bin"
    for f in *; do
        mv "$f" "${f}2"
    done
}

sha256sums=('462a73672f7527517d863930bb442ed1986c35dfb6960e0fb1cb84393deea652')
