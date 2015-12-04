# Maintainer:Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Rorschach <r0rschach@lavabit.com
# Contributor: Nathan Owe <ndowens04+AUR @ gmail.com>

pkgbase=afick
pkgname=('afick' 'afick-gui')
pkgver=3.5.1
pkgrel=1
pkgdesc="A security tool similar to tripwire"
arch=('any')
url="http://afick.sourceforge.net/"
license=('GPL')
makedepends=('perl-tk')
backup=('etc/afick.conf')
source=(http://sourceforge.net/projects/afick/files/$pkgname/$pkgver/$pkgname-$pkgver.tgz)
md5sums=('0cbd139c80b69d27a1c70cb200944862')

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
depends=('perl-tk')
conflicts=('afick')

  cd "${srcdir}"/$pkgbase-$pkgver

  make DESTDIR="${pkgdir}" install-gui

  chmod a+r "${pkgdir}"/etc/{afick.conf,cron.daily/afick_cron}
  chmod a+rx "${pkgdir}"/{etc/logrotate.d,var/{log/afick,lib/afick,lib/afick/archive},usr/lib/afick/lib/Afick}
}
