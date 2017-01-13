# Maintainer: Ruben De Smet <ruben dot de dot smet at rubdos dot be>

pkgname='qccpack'
pkgver="0.61"
pkgrel=3
pkgdesc=''
url='http://qccpack.sourceforge.net/'
license=(
 'LGPL2'
)
source=(
 'http://netcologne.dl.sourceforge.net/project/qccpack/QccPack/0.61/QccPack-0.61-1.tar.gz'
)
sha512sums=(
 '0f7f581c8f6489126251175389645ac1255bfdf380aeb2565e16503558edb93837fb907291bf7207ca40e32c3f2cc37bc0e36734add064ffa6d3be598432a435'
)
arch=(
 'i686'
 'x86_64'
)
depends=(
 'bash'
 'gcc-libs'
)
makedepends=(
)
checkdepends=(
)
options=(
 '!emptydirs'
)

build() {
 ls
 pwd
 cd QccPack/
 cp QccPack.config.linux QccPack.config
 sed -ie "s|/usr/local/src/QccPack|$(pwd)|" QccPack.config
 sed -ie "s|QCCPACK_INSTALL = .*$|QCCPACK_INSTALL = ${pkgdir}/usr/|g" QccPack.config
 sed -ie "s|CFLAGS = -O -Wall|CFLAGS = -msse -msse2 -msse3 -march=native -mfpmath=sse -O3 -Wall|g" QccPack.config

 imake
 make Makefiles
 make
}

package() {
 cd QccPack
 make install
}

post_install() {
 ldconfig
}

post_remove() {
 ldconfig
}

# vim: tabstop=1 expandtab
