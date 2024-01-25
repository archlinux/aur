# Maintainer: acd407 <acd407@qq.com>

pkgname=beepalsa
pkgver=r9.8339517
pkgrel=1
pkgdesc='Just like beep, except that it plays via ALSA'
arch=('x86_64')
url='https://github.com/Sound-Linux-More/beepalsa'
license=('GPL-2.0-only')
depends=('alsa-lib' 'glibc')
makedepends=('git')
provides=('beepalsa')
conflicts=('beep')
source=("${pkgname}"::'git+https://github.com/Sound-Linux-More/beepalsa.git')
sha512sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}"
	make
}

package() {
	cd "${srcdir}/${pkgname}"
	install -Dm0755 beepalsa "${pkgdir}/usr/bin/beepalsa"
    install -Dm0644 man/beepalsa.1 "${pkgdir}/usr/share/man/man1/beepalsa.1"
    cd "${pkgdir}/usr/bin"
    ln -sv beepalsa beep
}
