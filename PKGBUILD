# Maintainer: Riderius <riderius.help@gmail.com>

pkgname='git-fame'
pkgver='2.0.1'
pkgrel=1
pkgdesc='Pretty-print git repository collaborators sorted by contributions'
arch=('any')
url="https://github.com/casperdcl/$pkgname"
license=('MPL-2.0')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
depends=('python-argopt' 'python-tqdm' 'python-tabulate')
provides=('git-fame')
source=("$pkgname::git+$url#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    rm "$pkgdir/usr/lib/python3.12/site-packages/gitfame/git-fame.1"
    install -Dm644 "${srcdir}/git-fame/gitfame/git-fame.1" "${pkgdir}/usr/share/man/man1/git-fame.1"
    # install -Dm644 "${srcdir}/git-of-theseus-survival-plot.1" "${pkgdir}/usr/share/man/man1/git-of-theseus-survival-plot.1"
    # install -Dm644 "${srcdir}/git-of-theseus-stack-plot.1" "${pkgdir}/usr/share/man/man1/git-of-theseus-stack-plot.1"
    # install -Dm644 "${srcdir}/git-of-theseus-line-plot.1" "${pkgdir}/usr/share/man/man1/git-of-theseus-line-plot.1"
}
