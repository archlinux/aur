# Maintainer: Ghassan Alduraibi <git@ghassan.dev>

pkgname=python-gymnasium-notices
_name=${pkgname#python-}
pkgver=0.0.1
_pkgver=v${pkgver}
pkgrel=1
pkgdesc="Notices for Gymnasium that may be displayed on import on internet connected systems, in order to give notices if versions have major reproducibility issues, are very old and need to be upgraded, or other similar issues."
arch=('any')
url="https://github.com/Farama-Foundation/gym-notices"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name}-$pkgver.tar.gz" "LICENSE.txt::https://raw.githubusercontent.com/Farama-Foundation/gym-notices/main/LICENSE.txt")
b2sums=('da0a264be1309f33da12d98c3891c4b232e300734dbd3dba810106ec7ba249edf63315c09ddd9d9a6f5006c61e09a02c98584f7409fbbab91c2ad4998a10a4af'
        '27a79c99621fc5f1aad7bd4a7f5c035f38a6cac5205d45f4c0f48ee738cab48bf77048eba43a2507fee474b478729772f896e1b15b3559f2025e039ae86e48f2')

build() {
    # cd "${_name//-/_}"
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 ${srcdir}/LICENSE.txt "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt"
}
