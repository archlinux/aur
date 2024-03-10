# Maintainer: Riderius <riderius.help@gmail.com>

pkgname='git-of-theseus'
pkgver='0.3.4'
pkgrel=2
pkgdesc='Plot stats on Git repositories'
arch=('any')
url="https://github.com/erikbern/$pkgname"
license=('Apache-2.0')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
depends=('python-gitpython'
    'python-numpy'
    'python-tqdm'
    'python-wcmatch'
    'python-pygments'
    'python-matplotlib')
provides=('git-of-theseus'
    'git-of-theseus-analyze'
    'git-of-theseus-survival-plot'
    'git-of-theseus-stack-plot'
    'git-of-theseus-line-plot')
optdepends=('python-scipy: for plotting exponential fit in git-of-theseus-survival-plot')
_commit='1d77f082a9b25fb3a0c541641722cd4836135362'
source=("$pkgname::git+$url#commit=$_commit"
    'git-of-theseus-analyze.1'
    'git-of-theseus-survival-plot.1'
    'git-of-theseus-stack-plot.1'
    'git-of-theseus-line-plot.1')
sha256sums=('SKIP'
            'a681587c1282efc8180d987d27f1a97dfda02aa3957096eeab1a7b43b8c304ea'
            '4cd91120902468ed85007e993a1688d9f0d38bcf528e08df090a05733d9314a7'
            'c796f1ef82329fb2e2c7fcbe3c6ac750544090a6e36825bf4a0487cca90ab6e4'
            '9338bab5c137db6c72e399b59e917dbd7efb81ffa94d81a6f46a601d44a362bd')

build() {
    cd "$srcdir/$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "${srcdir}/git-of-theseus-analyze.1" "${pkgdir}/usr/share/man/man1/git-of-theseus-analyze.1"
    install -Dm644 "${srcdir}/git-of-theseus-survival-plot.1" "${pkgdir}/usr/share/man/man1/git-of-theseus-survival-plot.1"
    install -Dm644 "${srcdir}/git-of-theseus-stack-plot.1" "${pkgdir}/usr/share/man/man1/git-of-theseus-stack-plot.1"
    install -Dm644 "${srcdir}/git-of-theseus-line-plot.1" "${pkgdir}/usr/share/man/man1/git-of-theseus-line-plot.1"
}
