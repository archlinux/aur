# Maintainer: Roman Beslik <me@beroal.in.ua>

pkgname='mozart1-bin'
pkgver='1.4.0.20080704_16189'
pkgrel=1
pkgdesc='An open source implementation of Oz 3.'
arch=(i686 x86_64)
url='https://mozart.github.io/mozart-v1/'
license=(custom)
depends=(lib32-tk85 emacs)
conflicts=(mozart2)
if [[ $CARCH == i686 ]]; then
  depends+=(zlib gmp4 gcc-libs libx11 libxss libxext libxcb libxau libxdmcp)
else
  depends+=(lib32-{glibc,zlib,gmp4,gcc-libs,libx11,libxss,libxext,libxcb,libxau,libxdmcp})
fi
source=(bin.rpm::https://sourceforge.net/projects/mozart-oz/files/v1/1.4.0-2008-07-04-mandriva/mozart-1.4.0.20080704-16189.i586.rpm/download
	arch.patch
	)
sha512sums=(035b1260b5a4ecffb84440586ebc2cee381fba387f6d597baf525e1d7808da92d115108fbd7b94f6265ac50edb397d1bb147d2cc8bdc89753a03edf0eb7a3aee
	c80faadc49f777396a83d0e6db2d68887b9c064f78b313f65357bc793320574f20c6293f66f3496ab501f13a02a89a68f14aced2dd0e905009199bc7af0f2474
	)
prepare() {
	cd "$srcdir"
	patch -u -p1 < arch.patch
	LICENSE_DIR="usr/share/licenses/$pkgname"
	mkdir -p -m 755 "$LICENSE_DIR"
	mv -t "$LICENSE_DIR" usr/lib/mozart/LICENSE*
}
package() {
	cd "$srcdir"
	cp -r -t "$pkgdir" usr etc
}
