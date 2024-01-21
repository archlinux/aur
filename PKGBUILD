# Maintainer: German Lashevich <german.lashevich@gmail.com>
#
# Source: https://github.com/zebradil/aur
#
# shellcheck disable=SC2034,SC2154
pkgname=kwt
pkgver=0.0.8
pkgrel=3
pkgdesc='Kubernetes Workstation Tools CLI'
url='https://github.com/carvel-dev/kwt'
arch=(any)
license=(apache-2.0)
install=''
makedepends=(bash go)
provides=(kwt)
source=(kwt-0.0.8::https://github.com/carvel-dev/kwt/archive/v0.0.8.tar.gz)
build () 
{ 
    set -eo pipefail;
    cd "$pkgname-$pkgver";
    export CGO_CPPFLAGS="${CPPFLAGS}";
    export CGO_CFLAGS="${CFLAGS}";
    export CGO_CXXFLAGS="${CXXFLAGS}";
    export CGO_LDFLAGS="${LDFLAGS}";
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw";
    ./hack/build.sh "$pkgver"
}
package () 
{ 
    set -eo pipefail;
    cd "$pkgname-$pkgver";
    BIN=$pkgname;
    install -Dm755 $BIN -t "$pkgdir/usr/bin"
}
sha256sums=('705e95244dda01be18bc7f58c7748ea55590c917504683bb1252569bafe8df9d')
