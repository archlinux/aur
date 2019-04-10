# Maintainer: David Birks <david@tellus.space>

pkgname=jx
pkgver=1.3.60
pkgrel=1
epoch=
pkgdesc="Command line tool for working with Jenkins X: automated CI/CD for Kubernetes"
arch=(x86_64)
url="https://github.com/jenkins-x/jx"
license=('Apache')
groups=()
depends=('git>=2.0.0' 'go>=1.9')
checkdepends=('dep')
source=($pkgname-$pkgver-git::git+https://github.com/jenkins-x/jx.git#tag=v$pkgver)
md5sums=('SKIP')

build() {
    export GOPATH="$startdir"
    echo $GOPATH
    mkdir -p "github.com/jenkins-x"
    rm -rf "github.com/jenkins-x/jx"
    mv -f "$pkgname-$pkgver-git" "github.com/jenkins-x/jx"
    cd "github.com/jenkins-x/jx"
    make build
}

package() {
    install -d "$pkgdir/usr/local/bin"
    cp "$srcdir/github.com/jenkins-x/jx/build/jx" "$pkgdir/usr/local/bin"
    chmod 755 "$pkgdir/usr/local/bin/jx"
}

