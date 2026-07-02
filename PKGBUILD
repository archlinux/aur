# Maintainer: Ruben De Smet <ruben dot de dot smet at rubdos dot be>

pkgname='qccpack'
pkgver="0.63"
pkgrel=1
pkgdesc=''
url='http://qccpack.sourceforge.net/'
license=(
 'LGPL2'
)
source=(
    "https://master.dl.sourceforge.net/project/qccpack/$pkgver/QccPack-$pkgver-$pkgrel.tar.gz"
)
sha512sums=('8518a240cc71903e125e2d6282cbb1ca4218d4115241570822a30e1aa777b602993ce24fe77b9d77a25c92092f70b0536b0f37b729b172412d24f25a4cd54267')
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
