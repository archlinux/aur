# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Denis Kasak <dkasak AT termina DOT org DOT uk>

## GPG key: https://github.com/jreese.gpg

pkgname=python-aiomultiprocess
_pkg=aiomultiprocess
pkgver=0.9.0
pkgrel=1
pkgdesc="asyncio version of the standard multiprocessing module"
url="https://github.com/jreese/aiomultiprocess"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('git' 'python-build' 'python-flit-core' 'python-installer')
source=("$pkgname::git+$url#tag=v$pkgver?signed")
sha256sums=('SKIP')
validpgpkeys=('9A24B14A6239AA5A450708B671FCFA26C45D960E') ## John Reese

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname"
    PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl

    local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
    install -d "$pkgdir/usr/share/licenses/$pkgname/"
    ln -s \
        "$_site/$_pkg-$pkgver.dist-info/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:ts=4:sw=4:et:
