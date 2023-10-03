# Maintainer: Alex Daum <alexander.daum@mailbox.org>
# Co-maintainer: Yao Yunshan <qimuzi@aliyun.com>
pkgname=eclipse-cpp-bin
pkgver=2023.09
_releasemonth="2023-09"
pkgrel=1
pkgdesc="Highly extensible IDE (C/C++ version)"
arch=('x86_64')
url="https://www.eclipse.org"
license=('EPL')
depends=()
# may add depends later
makedepends=('tar')
provides=('eclipse-cpp')
conflicts=('eclipse-cpp')
#file="https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/$_releasemonth/R/${pkgname%-bin}-$_releasemonth-R-linux-gtk-$CARCH.tar.gz&r=1"
file="https://mirrors.bfsu.edu.cn/eclipse/technology/epp/downloads/release/${_releasemonth}/R/${pkgname%-bin}-${_releasemonth}-R-linux-gtk-${arch}.tar.gz"
source=(
	"${file}"
	"eclipse-cpp.desktop"
	"eclipse-cpp.png"
)
sha512sums=('62bb58ce22873a5af2205c520bd28a3971fdcb0e7a27aeaeb2e7b717dfd2e7ce613f52885f459dddaf1274d19100f5561b6277cbea38c4c90142688ef8f990e5'
            '2156b0f409fe99673c731d084d8c617b0c8bf4dfd26a2d78f8d0f75c95c28cabde0dc8704ed6d2bb86bdda897949ee13ba0ee8c2e4ac8cadecd938934a24eca4'
            '7933c44f9e4d47aa89706e839fd5f1339e58454125cc8533ea4d7d391f677805ebcb937857ccea305f8829a2e8c6b38dc0447491ad0fbd26e55fcad6c782128f')

package() {
	tar -zxvf ${pkgname%-bin}-${_releasemonth}-R-linux-gtk-${arch}.tar.gz
	mkdir -p ${pkgdir}/opt
	cp -r ${srcdir}/eclipse ${pkgdir}/opt/eclipse-cpp
	mkdir -p ${pkgdir}/usr/bin
	ln -s /opt/eclipse-cpp/eclipse ${pkgdir}/usr/bin/eclipse-cpp
	install -Dm644 eclipse-cpp.desktop $pkgdir/usr/share/applications/eclipse-cpp.desktop
	# install -Dm644 eclipse-cpp.png "$pkgdir/usr/share/pixmaps/eclipse-cpp.png"
	# default comment icon because many icon theme has this icon
}
