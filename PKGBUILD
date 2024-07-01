# Maintainer: Riderius <riderius.help@gmail.com>

pkgname='git-fame'
pkgver='2.0.1'
pkgrel=3
pkgdesc='Pretty-print git repository collaborators sorted by contributions'
arch=('any')
url="https://github.com/casperdcl/$pkgname"
license=('MPL-2.0')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
depends=('python-argopt' 'python-tqdm' 'python-tabulate')
provides=('git-fame')
source=("$pkgname::git+$url#tag=v$pkgver")
sha256sums=('7efd52f1e7c8813a5395e866b29377e3c5f47cdf3dff78774656cb7d9733e65f')

build() {
    cd "$srcdir/$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    rm "$pkgdir/usr/lib/python3.12/site-packages/gitfame/git-fame.1"
    install -Dm644 "${srcdir}/git-fame/gitfame/git-fame.1" "${pkgdir}/usr/share/man/man1/git-fame.1"
}
