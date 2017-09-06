# Maintainer: Miroslav Koškár <http://mkoskar.com/>

pkgname='spring-boot-cli'
pkgver=1.5.6
_pkgver="$pkgver.RELEASE"
pkgrel=2
pkgdesc='Spring Boot CLI'
url='http://projects.spring.io/spring-boot/'
license=(Apache)
arch=(any)
depends=(bash 'java-environment>=6')

source=("https://repo.spring.io/release/org/springframework/boot/spring-boot-cli/$_pkgver/spring-boot-cli-$_pkgver-bin.tar.gz")
sha256sums=(d129e7952f8cc687da436db1fff091991e8b85500894e3bc655ecbda7da6d8ae)

package() {
    cd "spring-$_pkgver"

    install -d "$pkgdir/opt/$pkgname"
    cp -dr --preserve=mode bin lib legal "$pkgdir/opt/$pkgname"
    rm "$pkgdir/opt/$pkgname/bin/spring.bat"

    install -d "$pkgdir/usr/bin"
    ln -s "/opt/$pkgname/bin/spring" "$pkgdir/usr/bin/spring"

    install -D -m644 -t "$pkgdir/usr/share/bash-completion/completions" shell-completion/bash/spring
    install -D -m644 -t "$pkgdir/usr/share/zsh/site-functions" shell-completion/zsh/_spring
}
