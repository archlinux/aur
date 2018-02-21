
# Maintainer: Benjamin Navarro <navarro.benjamin13@gmail.com>

pkgname=docker-manager-git
_basename=${pkgname%-git}
pkgver=v0.2.beta.r2.g693a156
pkgrel=1
pkgdesc="Ease the use of docker containers (start/connect/save/stop), written in Golang."
arch=('x86_64' 'i686')
url="https://github.com/BenjaminNavarro/docker-manager"
license=('GPL')
depends=('glibc')
makedepends=('go' 'git')
provides=("$_basename")
conflicts=("$_basename")
options=('!strip' '!emptydirs')
source=('docker-manager::git+http://github.com/BenjaminNavarro/docker-manager#branch=master')
md5sums=('SKIP')

prepare() {
    export GOPATH="$srcdir/go"
    mkdir -p "$srcdir/go/src/github.com/BenjaminNavarro"
    ln -sf "$srcdir/$_basename" "$srcdir/go/src/github.com/BenjaminNavarro/$_basename"
    go get gopkg.in/yaml.v2
}

pkgver() {
    cd $_basename
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
    cd "$srcdir/go/src/github.com/BenjaminNavarro/$_basename"
    go install
}

package() {
    install -Dm755 "$srcdir/go/bin/$_basename" "$pkgdir/usr/bin/$_basename"
    cd "$srcdir/go/src/github.com/BenjaminNavarro/$_basename"
    # mkdir -p "$pkgdir/usr/share/licenses/$_basename"
    # install -m 0644 LICENSE "$pkgdir/usr/share/licenses/$_basename/"
}
