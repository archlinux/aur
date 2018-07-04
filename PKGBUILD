# Maintainer: Ariel AxionL <axionl@aosc.io>
pkgname=ciel-git 
pkgver=r330.da89de5
pkgrel=1
pkgdesc="A tool for controlling multi-layer file systems and containers." 
arch=('i686' 'x86_64') url="https://github.com/AOSC-Dev/ciel" 
license=('MIT') 
makedepends=('git' 'make' 'go' 'curl') 
source=($pkgname::git+https://github.com/AOSC-Dev/ciel.git
        'LICENSE') 
md5sums=('SKIP'
         'bbe02e54233da79f80cd59560bce11d5')
pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
    dir="$srcdir/$pkgname/"
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
    cd $dir
    git submodule update --init --recursive
    make && make PREFIX=${pkgdir}/usr install && make clean
}
