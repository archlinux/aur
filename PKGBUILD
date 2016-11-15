# Maintainer: max-k <max-kATpostDOTcom>
pkgname=sonar-scanner
pkgver=2.8
pkgrel=3
pkgdesc="Default launcher to analyze a project with SonarQube"
arch=('any')
url="http://www.sonarqube.org/"
license=('LGPL3')
depends=('java-runtime')
provides=('sonar-runner')
backup=("opt/$pkgname/conf/$pkgname.properties")
install="$pkgname.install"
source=("https://sonarsource.bintray.com/Distribution/$pkgname-cli/$pkgname-$pkgver.zip"
        "$pkgname.sh"
        "$pkgname.install")
md5sums=('981936861fa622bb97ffc3a66afa1caa'
         '8d64e9d68709013a33f1b61070ca1c1f'
         '7b8d20440ee4582c2070ef362179e817')

package() {
    mkdir -p "$pkgdir/etc/profile.d"
    install -Dm755 "$pkgname.sh" "$pkgdir/etc/profile.d/"

    cd "$pkgname-$pkgver"
    mkdir -p $pkgdir/opt/$pkgname/{bin,conf,lib}
    install -Dm755 "bin/sonar-runner" "$pkgdir/opt/$pkgname/bin/"
    install -Dm755 "bin/$pkgname" "$pkgdir/opt/$pkgname/bin/"
    install -Dm644 "lib/$pkgname-cli-$pkgver.jar" "$pkgdir/opt/$pkgname/lib/"
    install -Dm644 "conf/sonar-scanner.properties" "$pkgdir/opt/$pkgname/conf/"
    ln -sf "/opt/$pkgname/conf" "$pkgdir/etc/$pkgname"
}
