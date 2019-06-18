# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=gitzone
pkgver=1.1
pkgrel=1
url=https://github.com/dyne/gitzone
pkgdesc='git-based zone management tool for static and dynamic domains'
arch=('any')
license=('AGPL3')
depends=('perl' 'bind' 'zsh')
source=("$pkgname-$pkgver::https://github.com/dyne/$pkgname/archive/v$pkgver.tar.gz" 'posix.patch')
sha256sums=('446599b3d1cc305be3e160dc39211e4ef35d30f0c8fcf0780cb9e21e652a6c20'
            '2997b6870db95c882129c0c6fb49c8b908b6f5ca1a2d30677b49d92b53f7dd25')
backup=('etc/gitzone.conf')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    patch -p0 < "$srcdir"/posix.patch
    find -type f -execdir sed -i 's#libexec/gitzone#share/gitzone/libexec#g' {} \;
    find -type f -execdir sed -i 's#var/bind#var/named#g' {} \;
    find -type f -execdir sed -i 's#var/cache/bind#var/cache/named#g' {} \;
    make PREFIX="$pkgdir"/usr install
    install -Dm 0644 etc/gitzone.conf "$pkgdir"/etc/gitzone.conf
}

