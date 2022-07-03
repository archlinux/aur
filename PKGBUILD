# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Demir Yerli <mrquantumoff@protonmail.com>
pkgname=quartz-messenger
pkgver=0.2.1
_pkgver=v${pkgver}
pkgrel=1
pkgdesc="libquartz based messenger"
arch=(x86_64)
url="http://bultek.synchron.com.ua/bultekdev/software/quartz-messenger"
license=('MIT')
groups=("mrquantumoff")
depends=("openssl")
makedepends=('git' 'cargo' 'rust')
replaces=()
backup=()
options=()
#source=("http://bultek.synchron.com.ua/bultekdev/software/quartz-messenger/-/archive/${_pkgver}/quartz-messenger-${_pkgver}.tar.gz")
#md5sums=('SKIP')

prepare() {
   cd $srcdir
   curl -k -LO "http://bultek.synchron.com.ua/bultekdev/software/quartz-messenger/-/archive/${_pkgver}/quartz-messenger-${_pkgver}.tar.gz"
   tar -xpf quartz-messenger-${_pkgver}.tar.gz
   rm quartz-messenger-${_pkgver}.tar.gz
}

build(){
	cd ${srcdir}/quartz-messenger-$_pkgver
	cargo build -r
}

package() {
	cd "$srcdir/quartz-messenger-$_pkgver"
	install -Dm755 -t "${pkgdir}/usr/bin/" target/release/quartz-messenger 
	chmod +x ${pkgdir}/usr/bin/quartz-messenger
}
