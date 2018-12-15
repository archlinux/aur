# Maintainer:Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Rorschach <r0rschach@lavabit.com
# Contributor: Nathan Owe <ndowens04+AUR @ gmail.com>

pkgbase=afick
pkgname=('afick' 'afick-gui')
pkgver=3.6.1
pkgrel=1
pkgdesc="A security tool similar to tripwire"
arch=('any')
url="http://afick.sourceforge.net/"
license=('GPL')
makedepends=('perl-tk')
backup=('etc/afick.conf')
source=(http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$pkgname-$pkgver.tgz)
sha256sums=('61d6f3f74e4e4df22fbc4bdcc44b25047fb483fac047e601c16b4e22aa7d00df')

build() {
  cd "${srcdir}"/$pkgbase-$pkgver

  perl Makefile.pl Makefile_sys.in
}

package_afick() {
depends=('perl')
conflicts=('afick-gui')

  cd "${srcdir}"/$pkgbase-$pkgver

  make DESTDIR="${pkgdir}" installspec

  chmod a+r "${pkgdir}"/etc/{afick.conf,cron.daily/afick_cron}
  chmod a+rx "${pkgdir}"/{etc/logrotate.d,var/{log/afick,lib/afick,lib/afick/archive},usr/lib/afick/lib/Afick}
}

package_afick-gui() {
pkgdesc="A security tool similar to tripwire with tk GUI"
depends=('perl-tk')
conflicts=('afick')

  cd "${srcdir}"/$pkgbase-$pkgver

  make DESTDIR="${pkgdir}" install-gui

  chmod a+r "${pkgdir}"/etc/{afick.conf,cron.daily/afick_cron}
  chmod a+rx "${pkgdir}"/{etc/logrotate.d,var/{log/afick,lib/afick,lib/afick/archive},usr/lib/afick/lib/Afick}
}
