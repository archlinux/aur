# Maintainer: Steven Spangler <132ikl@gmail.com>
# Maintainer: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>

pkgname=linx-client
pkgver=1.5.2
pkgrel=1
pkgdesc='Simple client for linx-server'
arch=('x86_64' 'i686' 'arm')
url='https://github.com/andreimarcu/linx-client'
license=('GPLv3')
makedepends=('go' 'git' 'mercurial')
source=("https://github.com/andreimarcu/linx-client/archive/v$pkgver.tar.gz")
sha256sums=('00b50f3c50aca19726ab204f9469adf252f7a8c011eed39e4bf3f2952f3d6ddd')

build() {
    case $CARCH in
        x86_64) go_arch=amd64;;
        i686) go_arch=386;;
        arm) go_arch=arm;;
    esac

    cd $pkgname-$pkgver
    GOPATH=$PWD/go
    GOBIN=$GOPATH/bin go get
    GOOS=linux GOARCH=$go_arch go build -o $pkgname
}

package() {
    cd $pkgname-$pkgver
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm755 linx-client -t "$pkgdir/usr/bin"
}
