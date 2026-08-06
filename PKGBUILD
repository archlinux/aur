# Maintainer: Kolonia333 <uiixexexe@gmail.com>
pkgname=javanya
pkgver=1.0.1
pkgrel=1
pkgdesc="Эзотерический язык программирования, транслирующийся в Java, с компилятором-кошкодевочкой"
arch=('any')
url="https://github.com/Kolonia333/JavaNya"
license=('MIT')
depends=('java-runtime>=17')
makedepends=('java-environment>=17')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Kolonia333/JavaNya/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('00c361e1e7a23b76ecc5f3b5f547007460277ede5b1ea8d82cd25fc0df0413e2')

build() {
    cd "JavaNya-$pkgver"
    mkdir -p build
    javac -encoding UTF-8 -d build src/main/java/Main/Main.java
    cd build
    jar cfe javanya.jar Main.Main Main/*.class
}

package() {
    cd "JavaNya-$pkgver/build"
    install -Dm644 javanya.jar "$pkgdir/usr/share/javanya/javanya.jar"

    install -d "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/javanya" << 'EOF'
#!/bin/sh
exec java -jar /usr/share/javanya/javanya.jar "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/javanya"

    install -Dm644 "$srcdir/JavaNya-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
