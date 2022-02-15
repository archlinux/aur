# Maintainer: Dario Vladovic <d.vladimyr@gmail.com>
pkgname=puddy-git
_pkgname="${pkgname%-git}"
pkgver=r15.5ea2c39
pkgrel=2
pkgdesc="Public DNS data yielder"
arch=('any')
url="https://github.com/jschauma/puddy"
license=('BSD3')
depends=('perl'
         'perl-io-socket-inet6'
         'perl-json'
         'perl-locale-codes'
         'perl-net-dns'
         'perl-net-ip'
         'perl-net-netmask'
         'perl-parallel-forkmanager'
         'perl-uri')
makedepends=('git')
provides=('puddy')
source=("git+$url.git"
        '0001-Add-DESTDIR-support.patch')
sha512sums=('SKIP'
            '34372f76ad2e22bed0a398f0cc3e1c7ce61c999ef443d2ff489e17cd6902ab3aee5a52f52bac66fbc85cd38fba5d2c94ae19b283ba81ffea1b3cf4133bb83948')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  patch -p1 -i "$srcdir/0001-Add-DESTDIR-support.patch"
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir/" PREFIX="/usr" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

