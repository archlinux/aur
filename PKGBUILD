# Maintainer: Caleb Maclennan <caleb@alerque.com>
pkgname=gitzone
pkgver=1.0
pkgrel=2
url=https://github.com/dyne/gitzone
pkgdesc='git-based zone management tool for static and dynamic domains'
arch=('any')
license=('AGPL3')
depends=('perl' 'bind')
source=("${pkgname}-${pkgver}::https://github.com/dyne/$pkgname/archive/v${pkgver}.tar.gz")
md5sums=('7dfedb6b4d350db97ed41f40519f4961')
backup=('etc/gitzone.conf')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    find -type f -execdir sed -i 's#libexec/gitzone#share/gitzone/libexec#g' {} \;
    find -type f -execdir sed -i 's#var/bind#var/named#p' {} \;
    find -type f -execdir sed -i 's#var/cache/bind#var/cache/named#p' {} \;
    make PREFIX=$pkgdir/usr install
    install -Dm 0644 etc/gitzone.conf $pkgdir/etc/gitzone.conf
}

