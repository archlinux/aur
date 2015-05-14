# Maintainer:Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Rorschach <r0rschach@lavabit.com
# Contributor: Nathan Owe <ndowens04+AUR @ gmail.com>

pkgname=afick
pkgver=3.5.0
pkgrel=1
pkgdesc="A security tool similar to tripwire"
arch=('any')
url="http://afick.sourceforge.net/"
license=('GPL')
depends=('perl')
backup=('etc/afick.conf')
source=(http://sourceforge.net/projects/afick/files/$pkgname/$pkgver/$pkgname-$pkgver.tgz)
md5sums=('fc388425d401c7c8126572c7cc9cd87b')

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
