# Maintainer: Aaron Plattner <aplattner@nvidia.com>
pkgname=git-credential-msal
pkgver=1.1.1
pkgrel=1
pkgdesc='Git credential helper for Microsoft Azure authentication'
arch=(any)
url='https://binary-eater.github.io/posts/git_oidc/'
license=(MIT)
makedepends=(python-build python-installer python-wheel python-setuptools-scm)
depends=(python-pyjwt python-keyring python-pyxdg python-msal 'git>=2.46')
source=("git+https://github.com/Binary-Eater/git-credential-msal#tag=v${pkgver}")
b2sums=('429bcbe861ca5249ddba13ed08016152fca3b8ba608ce5854d24bf416d0ab001845012082ceebdf62fafd5ff676c5f7006bd3f6f78381634039059016561fd53')

build() {
    cd "$srcdir/$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/MIT"
}
