# Maintainer: RangS-1 <rangga19sj@gmail.com>
pkgname=bashing
_repo=Bashing
pkgver=1.0.1
pkgrel=1
pkgdesc="Bash Scripting, such as laravel environment, githelper and more"
arch=('any')
url="https://github.com/RangS-1/Bashing"
license=('MIT')

depends=(
    bash
    git
    sudo
    pacman
    pacman-contrib
    networkmanager
    iproute2
    iputils
    procps-ng
    coreutils
    findutils
    gawk
    grep
    sed
    tar
    gzip
    systemd
    shadow
    mariadb
    php
    php-fpm
    composer
    nginx
    nodejs
    npm
    yay
)

makedepends=(
    
)

source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/RangS-1/${_repo}/archive/refs/tags/v$pkgver.tar.gz"
)

sha256sums=('b60604a1852db62662c3f08badf3ef1f4dc4b9928d42c201e362d88fa820b6a3')

package() {
    cd "$srcdir/${_repo}-${pkgver}"

    install -dm755 "$pkgdir/usr/bin"

    for script in *; do
        [[ -d "$script" ]] && continue
        [[ "$script" == "README.md" ]] && continue

        if [[ -x "$script" ]]; then
            install -Dm755 "$script" "$pkgdir/usr/bin/$script"
        fi
    done

    install -Dm644 README.md \
        "$pkgdir/usr/share/doc/$pkgname/README.md"

    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}