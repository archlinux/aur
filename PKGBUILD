# Maintainer: robertfoster

pkgname=jkk-git
pkgver=r3.cbc5e60
pkgrel=1
pkgdesc='A git-like cli for Jenkins written in Kotlin'
url='https://github.com/Polpetta/jkk'
arch=('any')
license=('GPL3')
depends=('java-runtime>=11')
makedepends=('git' 'gradle')
source=("${pkgname%-git}::git+https://github.com/polpetta/jkk")

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    gradle install
}

check() {
    cd "$srcdir/${pkgname%-git}"
    gradle test
}

package() {
    cd "$srcdir/${pkgname%-git}"/build/
    
    install -Dm 755 install/jkk/bin/jkk -t "${pkgdir}/usr/share/java/${pkgname%-git}/bin"
    install -Dm 644 install/jkk/lib/* -t "${pkgdir}/usr/share/java/${pkgname%-git}/lib"
    install -d "${pkgdir}/usr/bin"
    ln -s /usr/share/java/${pkgname%-git}/bin/jkk "${pkgdir}/usr/bin/jkk"
    
    install -Dm 644 ../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname%-git}"
    install -Dm 644 ../README.md -t "${pkgdir}/usr/share/doc/${pkgname%-git}"
}

md5sums=('SKIP')
