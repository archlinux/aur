# Maintainer: Valerii Huz <ghotrix at gmail dot com>
pkgname=lc0-client-git
_pkgname=lc0-client
pkgver=128
pkgrel=1
pkgdesc="Client for games generation to train Leela Chess Zero."
arch=('i686' 'x86_64')
url="https://lczero.org/"
license=('GPLv3')
optdepends=('lc0-cudnn-git')
makedepends=('git' 'go<=1.15.8')
source=("${_pkgname}::git+https://github.com/LeelaChessZero/lczero-client.git#branch=master")
md5sums=('SKIP')

prepare() {
    cd "${srcdir}/${_pkgname}"
    export GOPATH=${GOPATH}:${HOME}/go:`pwd`
    go get -u github.com/Tilps/chess
    go get -u github.com/nightlyone/lockfile
}

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git rev-list --count HEAD
}

build() {
    cd "${srcdir}/${_pkgname}"
    export GOPATH=${GOPATH}:${HOME}/go:`pwd`
    go build lc0_main.go
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm755 lc0_main $pkgdir/usr/bin/lc0_client
}
