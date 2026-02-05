pkgname=certbot-dns-multi
pkgver=4.30.1
pkgrel=1
pkgdesc="Certbot DNS plugin supporting multiple providers, using github.com/go-acme/lego."
arch=(x86_64)
license=(MIT)
source=(git+https://github.com/alexzorin/$pkgname.git#tag=$pkgver)
depends=('certbot' 'python-acme')
makedepends=(python-build python-installer python-wheel python-setuptools-scm python-setuptools-golang go)
sha256sums=('1c9928f19e61fc55dadb90309401ffa8de3e924a18b5d3dadb099773a25d5e6e')

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    cd $pkgname
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname
    python -m installer --destdir="$pkgdir" dist/*.whl
}
