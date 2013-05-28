# Maintainer: Vianney le Clément de Saint-Marcq <vleclement AT gmail·com>
_pkgname=arch-luks-suspend
pkgname=$_pkgname-git
pkgver=20130528.gdd13c91
pkgrel=1
pkgdesc="Lock encrypted root volume on suspend"
arch=('any')
url="https://github.com/vianney/arch-luks-suspend"
license=('GPL3')
depends=('systemd' 'cryptsetup' 'mkinitcpio')
makedepends=('git')
backup=('etc/systemd/system/systemd-suspend.service')
install=install
source=("git://github.com/vianney/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  _date=$(git show -s --format='%ci' | cut -d' ' -f1 | sed 's/-//g')
  _hash=$(git show -s --format='%h')
  echo "$_date.g$_hash"
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
