# Maintainer: Jean Finas <jean@finas.io>
# Contributer: Ignacio Felipe <djkork@gmail.com>
pkgname=qsync
pkgver=1.0.5.0305
pkgrel=3
epoch=1
pkgdesc="QNap's synchronization client"
url="https://www.qnap.com/en/utilities/essentials"
arch=('x86_64')
license=('custom')
optdepends=('nautilus: this client has nautlius integration')
changelog=
source=("${pkgname}-${pkgver}.deb::https://download.qnap.com/Storage/Utility/QNAPQsyncClientUbuntux64-${pkgver}.deb"
	'kde-open5'
    'Qsync.sh.patch'
    'QsyncRestart.sh.patch'
    )


noextract=()
md5sums=('9c34cb93a86e1d3364c12a4a1270232d'
    'ef5abc8367e97f42313bb4545d6acadf'
    '923af1881c03c429c4623305d108a5b5'
    'cfa6be2d8391bde792381740542176b2'
    )

package() {
	cd $srcdir

	ar x "${pkgname}-${pkgver}.deb"

	tar -xf data.tar.xz -C "${pkgdir}"

	install -D -m 755 -o root "${srcdir}/kde-open5" "${pkgdir}/usr/local/bin/QNAP/QsyncClient/kde-open5"

    qnapdir="${pkgdir}/usr/local/bin/QNAP/QsyncClient"
    patch "${qnapdir}/Qsync.sh" < "${srcdir}/Qsync.sh.patch"
    patch "${qnapdir}/QsyncRestart.sh" < "${srcdir}/QsyncRestart.sh.patch"

}
