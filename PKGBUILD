# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=devtools32-git
_pkgname=devtools
pkgver=20180523
pkgrel=1
pkgdesc='Tools for Arch Linux package maintainers'
arch=('any')
license=('GPL')
url='https://github.com/archlinux32/devtools32'
depends=('namcap' 'openssh' 'subversion' 'rsync' 'arch-install-scripts'
         'git' 'bzr' 'mercurial')
provides=($_pkgname=$pkgver)
conflicts=($_pkgname)
source=("https://sources.archlinux.org/other/$pkgname/$pkgname-$pkgver.tar.gz"{,.sig})
source=("$pkgname::git+https://github.com/bbidulock/devtools32.git")
validpgpkeys=('487EACC08557AD082088DABA1EB2638FF56C0C53'
              '4AA4767BBC9C4B1D18AE28B77F2D434B9741E8AC'
              '86CFFCA918CF3AF47147588051E8B148A9999C34'
              '8FC15A064950A99DD1BD14DD39E4B877E62EB915'
              '8218F88849AAC522E94CF470A5E9288C4FA415FA'
              'B81B051F2D7FC867AAFF35A58DBD63B82072D77A')
md5sums=('45d4334ed90d9c41adc8c34eea93dcfa'
         'SKIP')
md5sums=('SKIP')

pkgver() {
	cd ${pkgname}
	git show -s --format=%ci HEAD^{commit}|awk '{print$1}'|sed 's,-,,g'
}

prepare() {
	cd ${pkgname}
}

build() {
	cd ${pkgname}
	make PREFIX=/usr
}

package() {
	cd ${pkgname}
	make PREFIX=/usr DESTDIR=${pkgdir} install
}
