# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Demir Yerli <mrquantumoff@protonmail.com>
pkgname=quartz-messenger
pkgver=0.3.0
_pkgver=v${pkgver}
pkgrel=1
pkgdesc="libquartz based messenger"
arch=(x86_64)
url="http://bultek.synchron.com.ua/bultekdev/software/quartz-messenger"
license=('MIT')
groups=("mrquantumoff")
depends=("openssl")
makedepends=('git' 'cargo' 'rust')
#source=("http://bultek.synchron.com.ua/bultekdev/software/quartz-messenger/-/archive/${_pkgver}/quartz-messenger-${_pkgver}.tar.gz")
#md5sums=('SKIP')

prepare() {
   cd ${srcdir}
   curl -k -LO "http://bultek.synchron.com.ua/bultekdev/software/quartz-messenger/-/archive/${_pkgver}/quartz-messenger-${_pkgver}.tar.gz"
   tar -xpf quartz-messenger-${_pkgver}.tar.gz
}

build(){
	cd ${srcdir}/quartz-messenger-${_pkgver}
	cargo build -r
}

package() {
	cd "${srcdir}/quartz-messenger-${_pkgver}"
	install -Dm755 -t "${pkgdir}/usr/bin/" target/release/quartz-messenger 
	chmod +x ${pkgdir}/usr/bin/quartz-messenger
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
