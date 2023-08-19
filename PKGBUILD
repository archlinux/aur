#  Maintainer: Laurent Carlier <lordheavym@archlinux.org>

pkgname=dsk-lua
pkgver=1.0.0
pkgrel=1
pkgdesc="Lets you write/read data to an Amstrad DSK file, for use into SJASMPlus"
arch=('any')
url="https://github.com/ClaireCheshireCat/${pkgname}"
license=(GPL3)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v$pkgver.tar.gz"
		dsk-lua.sh
		dsk-lua.csh
		upstream-fixes.patch)
sha256sums=('f4aba5ecbc725eeb7ec4c351b9a74da82fe80e4e5c8bfa9b18406bed36624681'
            '80ac7f39cdd5b2e75b9ce82140987ca4869eca6cc1cc99e8248efc984e01b44e'
            '4647c572d4729922a0196dd2e024dad30fa9dc14b4ab9394d6f5ba94168be01b'
            'b3e001730f1cfd181f9f0b54cdb3dd372d6e012e515ff76ff62a79cf635d1a79')

prepare() {
	cd ${pkgname}-${pkgver}

	patch -Np1 -i ../upstream-fixes.patch
}

package() {
	depends=(sjasmplus-z00m128)

	cd ${pkgname}-${pkgver}

	install -m644 -Dt "${pkgdir}/usr/share/doc/${pkgname}" README.md
	install -m644 -Dt "${pkgdir}/usr/share/sjasmplus/${pkgname}" dsk.*

	install -m644 -Dt "${pkgdir}/etc/profile.d" ${srcdir}/dsk-lua.{c,}sh
}
