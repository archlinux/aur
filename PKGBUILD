# Maintainer: Justin Dray <justin@dray.be>
# Contributor: Mikeserv

pkgname=bcache-tools
pkgver=1.0.8
pkgrel=1
pkgdesc="Userspace tools for bcache until bcache merges with either dm or md"
changelog=bcache-tools.changelog
arch=('i686' 'x86_64')
url="http://bcache.evilpiepirate.org/"
license=('GPL')
depends=('util-linux')
makedepends=('git')
install="${pkgname}.install"
source=("https://github.com/g2p/${pkgname}/archive/v${pkgver}.zip"
'initcpio-arch.patch')
md5sums=('b5371b89410f6be90bbf2cfc1c45d96d'
         '208d7024340b8db3cf21325df40b6267')

prepare() {
	 cd "${srcdir}/${pkgname}-${pkgver}"
	 patch -Np1 -i "${srcdir}/initcpio-arch.patch"
 }

 build() {
	 cd "${srcdir}/${pkgname}-${pkgver}"
	 make
 }

 package() {
	 cd "${srcdir}/${pkgname}-${pkgver}"
	 mkdir -p ${pkgdir}/usr/bin
	 mkdir -p ${pkgdir}/usr/lib/udev/rules.d
	 mkdir -p ${pkgdir}/usr/share/man/man8
	 mkdir -p ${pkgdir}/usr/lib/initcpio/install

	 make DESTDIR="${pkgdir}" install
 }
