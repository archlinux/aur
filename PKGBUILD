# Maintainer: enihcam <enihcam@archlinux.us>

pkgname=python-oauth-cli-kit
pkgver=0.1.6
pkgrel=1
pkgdesc="A CLI-based OAuth2.0 authorization library for desktop applications"
arch=('any')
url="https://github.com/pinhua33/oauth-cli-kit"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling' 'python-hatch-vcs' )
depends=('python-httpx' 'python-platformdirs' )
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/o/oauth-cli-kit/oauth_cli_kit-0.1.6.tar.gz")
sha256sums=('7252f57e1a2f9dba7a94894c11b979f83884b3c88af3b4fe0206370a2b120499')

prepare() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    sed -i "s/version = .*/version = '${pkgver}'/" pyproject.toml || true
}

build() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname#python-}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
