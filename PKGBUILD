# Maintainer: Miroslav Koskar (http://mkoskar.com/)

pkgname='spring-boot-cli'
pkgver='1.2.5'
_pkgver="$pkgver.RELEASE"
pkgrel=1
pkgdesc='Spring Boot CLI'
url='http://docs.spring.io/spring-boot/docs/1.2.5.RELEASE/reference/html/getting-started-installing-spring-boot.html#getting-started-installing-the-cli'
license=('Apache')
arch=('any')
depends=('java-environment>=6')

source=("https://repo.spring.io/release/org/springframework/boot/spring-boot-cli/$_pkgver/spring-boot-cli-$_pkgver-bin.tar.gz")
md5sums=('36e363d1b182e43cbae34b775a90332a')

package() {
    cd "$srcdir/spring-$_pkgver"

    mkdir -p "$pkgdir/opt/$pkgname"
    cp -a bin lib legal "$pkgdir/opt/$pkgname"
    rm "$pkgdir/opt/$pkgname/bin/spring.bat"

    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/$pkgname/bin/spring" "$pkgdir/usr/bin/spring"

    install -D -m 644 shell-completion/bash/spring "$pkgdir/usr/share/bash-completion/completions/spring"
    install -D -m 644 shell-completion/zsh/_spring "$pkgdir/usr/share/zsh/site-functions/_spring"
}
