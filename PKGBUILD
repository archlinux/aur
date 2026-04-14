# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=mistralai
pkgname=python-$_name
pkgver=2.3.2
pkgrel=1
pkgdesc="Python Client SDK for the Mistral AI API."
arch=('any')
url="https://github.com/mistralai/client-python"
license=('MIT')
depends=('python' 'python-httpx' 'python-pydantic' 'python-dateutil' 'python-typing-inspection' 'python-opentelemetry-api' 'python-opentelemetry-semantic-conventions' 'python-jsonpath-python')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
optdepends=('python-google-auth: gcp' 'python-requests: gcp'
            'python-mcp: agents' 'python-griffe: agents' 'python-authlib: agents'
            'python-websockets: realtime')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('94fbf04a2d8c5d73773722ebe26adcad21160bc9490ec6c7e6f6ad3f0c4ec8d7')

build() {
    cd "$srcdir"/client-python-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir"/client-python-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}

