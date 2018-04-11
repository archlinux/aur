# Maintainer: Miroslav Koškár <http://mkoskar.com/>

pkgname='spring-boot-cli'
pkgver=2.0.1
_pkgver="$pkgver.RELEASE"
pkgrel=1
pkgdesc='Spring Boot CLI'
url='http://projects.spring.io/spring-boot/'
license=(Apache)
arch=(any)
depends=(bash 'java-environment>=8')

source=("https://repo.spring.io/release/org/springframework/boot/spring-boot-cli/$_pkgver/spring-boot-cli-$_pkgver-bin.tar.gz")
sha256sums=(230c33a954b50b64b22e8337c2d2e802c2d9d507fddc9484a5839ecc8998b1a8)

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
