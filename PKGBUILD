# Maintainer: asukaminato <asukaminato@nyan.eu.org>
pkgname=eigenmath-git
pkgver=r2380.4b00787
pkgrel=1
pkgdesc="Symbolic math app"
arch=('any')
url="https://github.com/georgeweigt/eigenmath"
license=('BSD')
provides=('eigenmath')
makedepends=('git')
source=("git+https://github.com/georgeweigt/eigenmath.git"
        "https://georgeweigt.github.io/eigenmath.pdf")
md5sums=('SKIP'
         '564095e39c563a7b7e03a218e448b8bd')
pkgver(){
        cd eigenmath
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build(){
        cd eigenmath
        make 
}
check(){
        cd eigenmath
        printf "exit\n" >> test/selftest1
        printf "exit\n" >> test/selftest2
        ./eigenmath test/selftest1
        ./eigenmath test/selftest2
}
package(){
        pushd eigenmath
        install -Dm755 eigenmath $pkgdir/usr/bin/eigenmath
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
        for f in doc/*;
        do
                install -Dm644 $f -t $pkgdir/usr/share/doc/$pkgname/
        done
        popd
        install -Dm644 eigenmath.pdf -t $pkgdir/usr/share/doc/$pkgname/
}
