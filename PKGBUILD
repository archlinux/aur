# Maintainer: Aaron Plattner <aplattner@nvidia.com>
pkgname=git-credential-msal
pkgver=1.1.0
pkgrel=1
pkgdesc='Git credential helper for Microsoft Azure authentication'
arch=(any)
url='https://binary-eater.github.io/posts/git_oidc/'
license=(MIT)
makedepends=(python-build python-installer python-wheel python-setuptools-scm)
depends=(python-pyjwt python-keyring python-pyxdg python-msal 'git>=2.46')
source=("git+https://github.com/Binary-Eater/git-credential-msal#tag=v${pkgver}")
b2sums=('48454e9521fd43af2f471c5a636e93acb974d6d036211e4c67b6ff938551b67bd58348a85938abc31829676d83f5d804c4a6a1ebd9f6c1fa4948f1493227f12e')

build() {
    cd "$srcdir/$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/MIT"
}
