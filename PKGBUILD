# Maintainer: Aaron Plattner <aplattner@nvidia.com>
pkgname=git-credential-msal
pkgver=1.0.0
pkgrel=1
pkgdesc='Git credential helper for Microsoft Azure authentication'
arch=(any)
url='https://binary-eater.github.io/posts/git_oidc/'
license=(MIT)
makedepends=(python-build python-installer python-wheel python-setuptools-scm)
depends=(python-pyjwt python-keyring python-pyxdg python-msal 'git>=2.46')
source=("git+https://github.com/Binary-Eater/git-credential-msal#tag=v${pkgver}")
b2sums=('131031e64fbdc40ab5fad317fd3ba5eb9953fe45400aff5038001089a0598de6eaf5c88fc6a9ee29c2fa144ca282ce183d8cba1fef02076c14b56f6302ff1eb2')

build() {
    cd "$srcdir/$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/MIT"
}
