# Maintainer: Kevin MacMartin <prurigro@gmail.com>

_pkgname=conky-colors
pkgname=$_pkgname-git
pkgver=20160428.r157.df2bb4b
pkgrel=2
pkgdesc='An easier way to configure Conky'
url='https://github.com/helmuthdu/conky_colors'
license=('GPL3')
arch=('armv6h' 'armv7h' 'arm' 'i686' 'x86_64')
depends=('python' 'conky' 'pystatgrab' 'python2-keyring' 'ttf-ubuntu-font-family' 'hddtemp' 'curl' 'lm_sensors')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha512sums=('SKIP')
install=$pkgname.install

pkgver() {
  cd ${_pkgname/-/_}
  printf "%s.r%s.%s" "$(git show -s --format=%ci master | sed 's/\ .*//g;s/-//g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${_pkgname/-/_}
  sed -i 's|\(ln -[^ ]* \)\$(DESTDIR)|\1/usr|;s|\$(DESTDIR)/bin|\$(DESTDIR)/usr/bin|' Makefile
}

build() {
  cd ${_pkgname/-/_}
  make
}

package() {
  cd ${_pkgname/-/_}
  install -dm755 "$pkgdir/usr/bin"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
