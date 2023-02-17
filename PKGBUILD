# Maintainer: asukaminato <asukaminato@nyan.eu.org>
pkgname=eigenmath-git
pkgver=r2386.058d263
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
         '5bd1ac29f2546e9677ea3adfc51b4aa2')
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
        install -Dm755 eigenmath -t "${pkgdir}/usr/bin/"
        install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
        for f in doc/*;
        do
                install -Dm644 "${f}" -t "${pkgdir}/usr/share/doc/${pkgname}/"
        done
        popd
        install -Dm644 eigenmath.pdf -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
