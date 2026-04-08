# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-mistralai
_name=${pkgname#python-}
pkgver=2.3.1
pkgrel=1
pkgdesc="Python Client SDK for the Mistral AI API."
arch=(any)
url="https://github.com/mistralai/client-python"
license=(MIT)
depends=(python-pydantic python-eval-type-backport python-dateutil python-typing-inspection python-httpx python-jsonpath-python python-opentelemetry-api python-opentelemetry-semantic-conventions)
optdepends=('python-google-auth: gcp' 'python-requests: gcp' 'python-mcp: agents' 'python-griffe: agents' 'python-authlib: agents' 'python-websockets: realtime')
makedepends=(python-hatchling python-build python-installer python-wheel)
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('02989e509124cb28aaffd92660bf7511b3f8f5c215e1de8d49d0c8276bacc72a')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

