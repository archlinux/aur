# Maintainer: Aaron Plattner <aplattner@nvidia.com>
pkgname=git-credential-msal
pkgver=1.0.1
pkgrel=1
pkgdesc='Git credential helper for Microsoft Azure authentication'
arch=(any)
url='https://binary-eater.github.io/posts/git_oidc/'
license=(MIT)
makedepends=(python-build python-installer python-wheel python-setuptools-scm)
depends=(python-pyjwt python-keyring python-pyxdg python-msal 'git>=2.46')
source=("git+https://github.com/Binary-Eater/git-credential-msal#tag=v${pkgver}")
b2sums=('b598e788ea82767fc80ad47f7d6d6a17b657145b29c1c0b3bf3895748de6998dd06ff956117522754e7b1df6a67ead75ffb4070c9eff5d36867064df71cac25e')

build() {
    cd "$srcdir/$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/MIT"
}
