# Maintainer: Ariel AxionL <axionl@aosc.io>
pkgname=ciel-git 
pkgver=r330.da89de5
pkgrel=1
pkgdesc="A tool for controlling multi-layer file systems and containers."
arch=('i686' 'x86_64')
url="https://github.com/AOSC-Dev/ciel"
license=('MIT')
depends=('bash')
makedepends=('git' 'make' 'go' 'curl')
optdepends=('dos2unix: Format ciel shell output.')

source=($pkgname::git+https://github.com/AOSC-Dev/ciel.git
        'https://raw.githubusercontent.com/AOSC-Dev/ciel/master/LICENSE')

sha256sums=('SKIP'
            '4295cbb316868e77c32b3ce2fc2487ce8a1f0e26b8ba677d44d0b3e16412c5fd')
pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $pkgname
    make
    make PREFIX=${srcdir}/build install
    make clean
}

package() {
    # License
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE

    # Binaries
    cd $srcdir/build
    install -Dm755 bin/ciel ${pkgdir}/usr/bin/ciel
    install -Dm755 libexec/ciel-plugin/ciel-* ${pkgdir}/usr/bin
}
# vim set: ts=4 sw=4 et
