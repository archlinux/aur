#Maintainer Sami "Y0USAF" Ansari OA99@Outlook.com
pkgname=python-cohere-git
pkgver=r215.4f5540d
pkgrel=1
pkgdesc="Cohere library for Python (git version)"
arch=('any')
url="https://github.com/cohere-ai/cohere-python"
license=('MIT')
depends=('python' 'python-aiohttp' 'python-backoff' 'python-fastavro' 'python-importlib-metadata' 'python-requests' 'python-urllib3')
makedepends=('git' 'python-poetry' 'python-pip')

source=("$pkgname::git+https://github.com/cohere-ai/cohere-python.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$pkgname"
    poetry build
    POETRY_NO_INTERACTION=1 poetry export -f requirements.txt -o requirements.txt
    pip install --no-deps --target="$pkgdir/$(python -c 'import site; print(site.getsitepackages()[0])')" dist/*.whl
}
