# $Id$
# Maintainer: Eden Rose <eenov1988(at)gmail(dot)com>
# Maintainer: Dave Reisner <dreisner@archlinux.org>

_pkgname=arch-install-scripts
pkgname=arch-install-scripts_custom
pkgver=17
pkgrel=1
pkgdesc="Scripts to aid in installing Arch Linux. With modified 
pacstrap, to include additional options. 11/9/17"
arch=('any')
url="https://projects.archlinux.org/arch-install-scripts.git"
license=('GPL')
depends=('bash' 'coreutils' 'pacman' 'util-linux')
provides=('arch-install-scripts' 'arch-install-scripts_custom')
conflicts=('arch-install-scripts_custom-git' 'arch-install-scripts')
source=("https://sources.archlinux.org/other/$_pkgname/$_pkgname-$pkgver.tar.gz"{,.sig}
'pacstrap.patch')
validpgpkeys=('487EACC08557AD082088DABA1EB2638FF56C0C53')  # Dave Reisner
md5sums=('5d230b9b53c2374445d220f439db3471'
         'SKIP'
	 'SKIP')

build() {
  patch $srcdir/"$_pkgname-$pkgver"/pacstrap.in < $srcdir/pacstrap.patch
  make -C "$_pkgname-$pkgver"
}

check() {
  make -C "$_pkgname-$pkgver" check
}

package() {
  make -C "$_pkgname-$pkgver" PREFIX=/usr DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
