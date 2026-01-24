# Maintainer: Omar Semgey <omar.semgey@gmail.com>
pkgname=forgefoundary
pkgver=1.0.0
pkgrel=1
pkgdesc="Flexible, framework-agnostic scaffolding tool"
arch=('any')
url="https://github.com/omarSemgey/ForgeFoundary"
license=('MIT')
depends=('php>=8.2' 'composer' 'git')
source=("https://github.com/omarSemgey/ForgeFoundary/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('910d4574dadcda2c24e02f7bdd4899d5814234dea81cc65a341a5206b6ce6293') 

package() {
    mkdir -p "$pkgdir/opt/$pkgname"
    cp -r "$srcdir/ForgeFoundary-$pkgver/"* "$pkgdir/opt/$pkgname/"
    cd "$pkgdir/opt/$pkgname"
    export COMPOSER_ALLOW_SUPERUSER=1
    composer install --no-dev --optimize-autoloader --no-interaction --prefer-dist
        install -Dm755 /dev/stdin "$pkgdir/usr/bin/ForgeFoundary" << 'EOF'
#!/bin/sh
exec php /opt/forgefoundary/ForgeFoundary "$@"
EOF

    install -Dm644 README.MD "$pkgdir/usr/share/doc/$pkgname/README.MD"
}
