# Maintainer: Rob Bailey <actioninja@criticalaction.net>
pkgname=docker-etchosts
pkgver=0.1.5
pkgrel=1
pkgdesc="Automatically update your /etc/hosts file with the names of docker containers"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/costela/docker-etchosts"
license=('GPL-3.0-or-later')
depends=('go')
makedepends=('git')
source=("git+$url.git#tag=$pkgver" "docker-etchosts.service")
sha512sums=('SKIP' 'SKIP')


build() {
    cd "$pkgname"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
    go build -o docker-etchosts
}

package() {
    cd "$pkgname"
    install -Dm755 "./docker-etchosts" "$pkgdir/usr/bin/docker-etchosts"
    install -Dm644 "$srcdir/docker-etchosts.service" "$pkgdir/usr/lib/systemd/system/docker-etchosts.service"
}

