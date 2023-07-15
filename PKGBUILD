#Maintainer: anonion <aur at anonion dot social>

pkgname=("python-py-natpmp")
_name=${pkgname#python-}
pkgver=r21.325af58
pkgrel=1
pkgdesc="A NAT-PMP (Network Address Translation Port Mapping Protocol) library and testing client in Python."
arch=('any')
url="https://github.com/yimingliu/py-natpmp"
license=('BSD')

makedepends=('python-wheel'
             'python-build'
             'python-installer'
             'python-setuptools')

source=("${_name}::git+https://github.com/yimingliu/py-natpmp")
sha256sums=('SKIP')

build() {
    cd "$_name"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

pkgver() {
    cd "$_name"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
