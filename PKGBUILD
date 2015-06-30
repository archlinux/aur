# Maintainer: Ariel Dabalsa <arieldabalsa@gmail.com>
pkgname=scron-git
_gitname=scron
pkgver=r152.56a6538
pkgrel=1
pkgdesc='Suckless cron daemon - git checkout'
arch=('i686' 'x86_64')
url='http://git.2f30.org/scron'
license=('MIT/X')
makedepends=('git')
provides=('cron')
conflicts=('cron')
source=('git://git.2f30.org/scron'
        'service')
md5sums=('SKIP'
         '03f689593cce17a451def6b5a9661e6e')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"

  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" PREFIX=/usr install

  install -Dm644 LICENSE           "$pkgdir/usr/share/licenses/$_gitname/LICENSE"
  install -Dm644 "$srcdir/service" "$pkgdir/usr/lib/systemd/system/scron.service"
}

# vim:set ts=2 sw=2 et:
