# Maintainer: Carl George < arch at cgtx dot us >

_name="python-swiftclient"
_module="${_name#python-}"
_cmd="${_module%client}"

pkgname=("python-$_module" "python2-$_module")
pkgver=3.3.0
pkgrel=1
pkgdesc="OpenStack Object Storage API Client Library"
arch=("any")
url="https://github.com/openstack/$_name"
license=("Apache")
makedepends=("python-pbr" "python2-pbr")
source=("https://tarballs.openstack.org/$_name/$_name-$pkgver.tar.gz")
sha256sums=('8b4d38d73ceb2ef4984b39fb924bf9b265050ca2beb5c6bf29cb9f34ccd0bf7d')

package_python-swiftclient() {
    depends=(
        "python-requests>=1.1"
        "python-six>=1.5.2"
    )
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-swiftclient() {
    depends=(
        "python2-futures>=3.0"
        "python2-requests>=1.1"
        "python2-six>=1.5.2"
    )
    cd "$_name-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1
    mv "$pkgdir/usr/bin/$_cmd" "$pkgdir/usr/bin/${_cmd}2"
    mv "$pkgdir/usr/share/man/man1/$_cmd.1" "$pkgdir/usr/share/man/man1/${_cmd}2.1"
}
