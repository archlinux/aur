# Maintainer: steve finkel <mrsteve0924 at verizon dot net>

pkgname=wstroke-git
pkgver=20260704.09c195c
pkgrel=1
pkgdesc="a mouse gesture plug-in for wayfire. port of easystroke"
arch=('x86_64')
url="https://github.com/dkondor/wstroke"
license=('ISC')
depends=('wayfire-git' 'wlroots0.20' 'cairo' 'glib2' 'gtk3' 'gtkmm3' 'boost-libs')
makedepends=('git' 'meson' 'ninja' 'vala')
optdepends=('wcm' 'libinput>=1.17')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/dkondor/wstroke')
options=('!strip' 'debug')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	 printf "%s.%s" \
        "$(git show -s --format=%cs | tr -d -)" \
        "$(git rev-parse --short HEAD)"

}

build() {
	cd "$srcdir/${pkgname%-git}"
	meson setup build --prefix=/usr
	ninja -C build
}


package() {
	cd "$srcdir/${pkgname%-git}"
	DESTDIR="$pkgdir/" ninja -C build install
	install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
