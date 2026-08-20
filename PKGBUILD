# Maintainer: ada <cmdada@proton.me>
pkgname=findmylinux-anisette
pkgver=2.2.2
pkgrel=1
pkgdesc="Anisette (Apple device-attestation) daemon for findmylinux, built from anisette-v3-server"
arch=('x86_64')
url="https://github.com/Dadoum/anisette-v3-server"
license=('AGPL-3.0-or-later')
depends=('openssl')
makedepends=('ldc' 'dub' 'git')
source=("git+https://github.com/Dadoum/anisette-v3-server.git#commit=2ef18d7da2abe3a6d070aa478f774538b947aaa2"
        "findmylinux-anisette.service")
sha256sums=('SKIP'
            'SKIP')

build() {
  cd "$srcdir/anisette-v3-server"
  export DUB_HOME="$srcdir/.dub"
  dub build -b release --compiler=ldc2
}

package() {
  install -Dm755 "$srcdir/anisette-v3-server/anisette-v3-server" \
    "$pkgdir/usr/bin/findmylinux-anisette"
  install -Dm644 "$srcdir/findmylinux-anisette.service" \
    "$pkgdir/usr/lib/systemd/user/findmylinux-anisette.service"
}
