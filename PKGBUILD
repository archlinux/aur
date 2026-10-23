pkgname=mkcue
_baseversion=1
_debianpkgrel=9
pkgver=${_baseversion}_${_debianpkgrel}
pkgrel=1
pkgdesc="generates a cue sheet from a cd"
arch=('i686' 'x86_64' 'armv7h')
url="https://packages.debian.org/sid/mkcue"
license=('LGPL')
makedepends=('quilt')
source=("https://httpredir.debian.org/debian/pool/main/m/mkcue/mkcue_${_baseversion}.orig.tar.gz"
        "https://httpredir.debian.org/debian/pool/main/m/mkcue/mkcue_${_baseversion}-${_debianpkgrel}.debian.tar.xz")
sha512sums=('925d43e1451c064c80058df9e9d35df6b36f8ae551ac0377838e07fdf87babc4706eb287825ee2ef8af2de1a363c54c3fca2e14ec72f6bb86fc7f0bbe8ba9c6e'
            'b53ea5cdc05248a7774822af19d46d4ed9d2b676280c0f8f81a312b45718bd0cf67d316036565abc51c1dc8d1081923694b09e6ddfa4088e273584ff6bcd0704')
b2sums=('42ac98bfc76fed6c2fb5200e3656723955e04244e70afe75ed07ddadaf119a0ab720e3aa4b746d48ac994abc6d4e51738e668b495f49f71864ac5d81d09e6d67'
            '112f7c0cf40578e4a1d8905646d044d4ccbcb75138b5b3e6747305cd61c603d81ef080e7d1293a42758916f83bfa921c1160df30303a9fbd78b49a7e7f332a3c')

prepare() {
	cd "${pkgname}-${_baseversion}.orig"
	ln -s $srcdir/debian/patches patches
	quilt push -a
}

build() {
	cd "${pkgname}-${_baseversion}.orig"
	export CXXFLAGS="-std=gnu++98 -ggdb3"
	./configure --prefix=/usr
	make
}

package() {
	cd "${pkgname}-${_baseversion}.orig"
	install -D mkcue $pkgdir/usr/bin/mkcue
}
