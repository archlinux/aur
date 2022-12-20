# Maintainer: Andrey Kolchenko <andrey@kolchenko.me>

pkgname=acers3fand
pkgver=r20.10b6ff0
pkgrel=2
pkgdesc='A script which controls your Acer Aspire S3 Ultrabook fan speed by cpu temperature'
url='https://github.com/enyone/acers3fand'
arch=(x86_64)
license=('GPL')

makedepends=('git')
depends=('perl' 'dmidecode')
optdepends=(
    'systemd: system and service manager to support acers3fand running automatically'
)

source=("git+https://github.com/enyone/acers3fand")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -Dm 755 "$srcdir/$pkgname/acer_ec.pl" "$pkgdir/usr/local/bin/acer_ec.pl"
    install -Dm 755 "$srcdir/$pkgname/acers3fand" "$pkgdir/usr/local/bin/acers3fand"
    install -Dm 644 "$(dirname $srcdir)/acers3fand.service" "$pkgdir/usr/lib/systemd/system/acers3fand.service"
}

