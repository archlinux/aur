# Maintainer: Dominik Kummer <admin@arkades.org>
# Maintainer: Sean Anderson <seanga2@gmail.com>
# Contributor: Roman Saveljev <roman.saveljev@haltian.com>
pkgname=kconfig-frontends
pkgver=4.11.0
pkgrel=3
pkgdesc='Linux kernel-style Kconfig parser and configuration frontends for third-party projects'
arch=('x86_64' 'i686')
url="https://bitbucket.org/nuttx/tools/"
license=('GPL')
depends=('python' 'perl')
makedepends=('gperf')
source=("https://gitlab.com/arkades.org/kconfig-frontends/-/archive/4.11.0/kconfig-frontends-4.11.0.tar.gz"
        "kconfig-config2h")
noextract=()
sha512sums=('50458644aaccad62ee2ef038d6c5eb6501a9f3b01467aa6196219efbaf68a7fa580765c4faa6686ca09c9d9fbe2a65f5124206bbb311d1b6305d0f3ac0425ac3'
            '2704d58e009e79a6ba098876dfca8dfc34da086d792b497424a73a679aeb97bc002d4267cc44422401b06338c42bc8651fdbede20779bae9c06a00590fe14234')
validpgpkeys=()

# prepare() {
# 	cd "$pkgname-$pkgver"
# 	patch -N --strip=1 < "${srcdir}/gperf_3.1.patch"
# }

build() {
	cd "$pkgname-$pkgver"
	autoreconf -fi
	./configure --prefix=/usr --enable-frontends=mconf,conf,nconf
	make
}

package() {
    install -dm755 ${pkgdir}/usr/bin
    install -m755 -t ${pkgdir}/usr/bin kconfig-config2h
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
