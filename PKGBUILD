# Maintainer:Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Rorschach <r0rschach@lavabit.com
# Contributor: Nathan Owe <ndowens04+AUR @ gmail.com>

pkgname=afick
pkgver=3.4.1
pkgrel=1
pkgdesc="Alternative to tripwire"
arch=('any')
url="http://afick.sourceforge.net/"
license=('GPL')
depends=('perl')
backup=('etc/afick.conf')
source=(http://sourceforge.net/projects/afick/files/$pkgname/$pkgver/$pkgname-$pkgver.tgz)
md5sums=('5836efdb7e9980a53e2cfac7d2934967')

prepare() {
  cd "${srcdir}"/$pkgname-$pkgver

  install -d Afick
  cp -a *.pm Afick
}

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  perl Makefile.pl
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install

  chmod a+r "${pkgdir}"/etc/{afick.conf,cron.daily/afick_cron}
  chmod a+rx "${pkgdir}"/{etc/logrotate.d,var/{log/afick,lib/afick,lib/afick/archive},usr/lib/afick/lib/Afick}
}
