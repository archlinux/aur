# $Id$
# Original Extra repo
# Maintainer: Pierre Schmitz <pierre@archlinux.de>

# Modifications to use namcap-git
# Maintainer: James Harvey <jamespharvey20@gmail.com>

pkgname=devtools-namcapgit
_pkgname=devtools
pkgver=20151129
pkgrel=1
pkgdesc='Tools for Arch Linux package maintainers (uses namcap-git)'
arch=('any')
license=('GPL')
url='http://projects.archlinux.org/devtools.git/'
depends=('namcap-git' 'openssh' 'subversion' 'rsync' 'arch-install-scripts')
provides=('devtools')
conflicts=('devtools')
source=("https://sources.archlinux.org/other/$_pkgname/$_pkgname-$pkgver.tar.gz"{,.sig})
validpgpkeys=('487EACC08557AD082088DABA1EB2638FF56C0C53'
              '4AA4767BBC9C4B1D18AE28B77F2D434B9741E8AC'
              '86CFFCA918CF3AF47147588051E8B148A9999C34')
md5sums=('86fe057b7180ce0247338e64f1a8722c'
         'SKIP')

prepare() {
	sed -i 's|pacman -S --needed --noconfirm namcap|pacman -S --needed --noconfirm namcap-git|' ${_pkgname}-${pkgver}/makechrootpkg.in
}

build() {
	cd "${_pkgname}-${pkgver}"
	make PREFIX=/usr
}

package() {
	cd "${_pkgname}-${pkgver}"
	make PREFIX=/usr DESTDIR=${pkgdir} install
}
