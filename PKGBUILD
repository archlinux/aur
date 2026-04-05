# Maintainer: Kushagra Sharma <tda@thedarkartist.in>
pkgname=gdrivectl
pkgver=0.1.0
pkgrel=1
pkgdesc="CLI tool to manage Google Docs permissions in bulk — grant, revoke, audit"
arch=('any')
url="https://github.com/TheDarkArtist/gdrivectl"
license=('MIT')
depends=('python' 'python-google-api-python-client' 'python-google-auth'
         'python-google-auth-oauthlib' 'python-click' 'python-rich'
         'python-prompt_toolkit')
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-pip')
source=("https://pypi.org/packages/source/g/gdrivectl/gdrivectl-${pkgver}.tar.gz")
sha256sums=('8f0e3694ddeccd694dda9a5cd450b0446c5acd2b6a029f20569fba10f846a894')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    pip install --root="${pkgdir}" --no-deps --ignore-installed questionary
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
