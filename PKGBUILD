# Maintainer: Miroslav Koškár <https://mkoskar.com/>

pkgname=spring-boot-cli
pkgver=3.1.2
pkgrel=1
pkgdesc='Spring Boot CLI'
url=https://spring.io/projects/spring-boot
license=(Apache)
arch=(any)
depends=(bash 'java-environment>=17')

source=("https://repo.maven.apache.org/maven2/org/springframework/boot/spring-boot-cli/$pkgver/spring-boot-cli-$pkgver-bin.tar.gz")
md5sums=('881fb3297504b4ea8418c1b806dff343')

package() {
    cd spring-"$pkgver"

    install -d "$pkgdir/opt/$pkgname"
    cp -dr --preserve=mode -t "$pkgdir/opt/$pkgname" bin lib legal
    rm "$pkgdir/opt/$pkgname/bin/spring.bat"

    install -d "$pkgdir"/usr/bin
    ln -s /opt/"$pkgname"/bin/spring "$pkgdir"/usr/bin/spring

    install -D -m644 -t "$pkgdir"/usr/share/bash-completion/completions shell-completion/bash/spring
    install -D -m644 -t "$pkgdir"/usr/share/zsh/site-functions shell-completion/zsh/_spring
}
