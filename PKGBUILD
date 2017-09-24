# Maintainer: pancho horrillo <pancho at pancho dot name>
# Contributor: Bram Swenson <bram at craniumisajar dot com>
# Contributor: Marti Raudsepp <marti at juffo dot org>

pkgname='concourse-fly-git'
pkgver=1
pkgrel=2
pkgdesc='Command line interface to the Concourse continuous integration tool'
arch=('x86_64')
url='https://concourse.ci/fly-cli.html'
license=('Apache')
makedepends=('go')
checkdepends=()
source=('git://github.com/concourse/concourse.git')
sha512sums=('SKIP')

build () {
    cd concourse
    export GOPATH="$PWD"
    git submodule update --init --recursive
    cd src/github.com/concourse/fly
    go build
}

check () {
    cd concourse
    export GOPATH="$PWD"
    go get github.com/onsi/ginkgo/ginkgo
    cd src/github.com/concourse/fly
    "$GOPATH"/bin/ginkgo -r
}

package () {
    cd concourse
    mkdir -p "$pkgdir"/usr/bin
    cp -a src/github.com/concourse/fly/fly "$pkgdir"/usr/bin
}
