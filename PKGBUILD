# Maintainer: steve finkel <mrsteve0924 at verizon dot net>

pkgname=wstroke
pkgver=2.4.0
pkgrel=1
pkgdesc="a mouse gesture plug-in for wayfire. port of easystroke"
arch=('x86_64')
url="https://github.com/dkondor/wstroke"
license=('ISC')
depends=('wayfire>=0.10' 'wayfire<0.11' 'wlroots0.19' 'cairo' 'glib2' 'gtk3' 'gtkmm3' 'boost-libs')
makedepends=('git' 'meson' 'ninja' 'vala' 'boost')
optdepends=('wcm' 'libinput>=1.17')
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dkondor/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('8324efeea450b3bf5670b66f15a2a02ba87654fbd66752b1d57248a23f12da19')

prepare() {
	:
}	

build() {
	cd "$pkgname-$pkgver"
	meson setup build --prefix=/usr
	ninja -C build
}


package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir/" ninja -C build install
	install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"	
}
