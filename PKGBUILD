# Maintainer: Miroslav Koškár <http://mkoskar.com/>

pkgname='spring-boot-cli'
pkgver=1.5.7
_pkgver="$pkgver.RELEASE"
pkgrel=2
pkgdesc='Spring Boot CLI'
url='http://projects.spring.io/spring-boot/'
license=(Apache)
arch=(any)
depends=(bash 'java-environment>=6')

source=("https://repo.spring.io/release/org/springframework/boot/spring-boot-cli/$_pkgver/spring-boot-cli-$_pkgver-bin.tar.gz")
sha256sums=(fc8481a5c2fd6bac11a56705878bf870b8a98d427b255ae45ef4f8e1c2c08922)

package() {
    cd "spring-$_pkgver"

    install -d "$pkgdir/opt/$pkgname"
    cp -dr --preserve=mode -t "$pkgdir/opt/$pkgname" bin lib legal
    rm "$pkgdir/opt/$pkgname/bin/spring.bat"

    install -d "$pkgdir/usr/bin"
    ln -s "/opt/$pkgname/bin/spring" "$pkgdir/usr/bin/spring"

    install -D -m644 -t "$pkgdir/usr/share/bash-completion/completions" shell-completion/bash/spring
    install -D -m644 -t "$pkgdir/usr/share/zsh/site-functions" shell-completion/zsh/_spring
}
