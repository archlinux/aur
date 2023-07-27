pkgname=jd-cli
pkgver=1.2.1
pkgrel=2
arch=('any')
depends=('java-runtime>=8')
# Unclear if this is GPL-3.0-only, or GPL-3.0-or-later.
# https://github.com/intoolswetrust/jd-cli/issues/36
license=('GPL3')
makedepends=('maven')
url='https://github.com/intoolswetrust/jd-cli'
source=("$url/archive/refs/tags/$pkgname-$pkgver.tar.gz")
sha256sums=('db39c3286e4dd64ddc328738c6597178a083c223900edcc9a5012163a54ec95a')

package() {
    install -Dm644 "$srcdir/$pkgname-jd-cli-$pkgver/jd-cli/target/jd-cli.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
    install -d "$pkgdir/usr/bin"
    echo -e "#!/bin/sh\nexec java -jar /usr/share/java/$pkgname/$pkgname.jar" '"$@"' > "$pkgdir/usr/bin/$pkgname"
    chmod 755 "$pkgdir/usr/bin/$pkgname"
}

build() {
    cd $srcdir/$pkgname-jd-cli-$pkgver
    mvn --batch-mode verify
}

check() {
    cd $srcdir/$pkgname-jd-cli-$pkgver
    mvn --batch-mode test
}
