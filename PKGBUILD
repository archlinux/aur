# Maintainer: Matthias Jaros <jaros@mailbox.org>
pkgname=kwin-effects-grayscale-git
pkgver=r40.69e33d3
pkgrel=1
pkgdesc="Configurable grayscale effect for KWin window manager and KDE desktop environment."
arch=('i686' 'x86_64')
url="https://github.com/murat-cileli/kwin-grayscale-effect"
license=('GPL')
groups=()
depends=('kwin')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+https://github.com/murat-cileli/kwin-grayscale-effect.git")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
	cd "$srcdir/${pkgname%-git}"
	test -d kwin4_effect_grayscale
}

package() {
	cd "$srcdir/${pkgname%-git}"
	#make DESTDIR="$pkgdir/" install
	install -dm0755 "$pkgdir/usr/share/kwin/effects/" 
	install -dm0755 "$pkgdir/usr/share/kservices5/kwin/" 

	# from readme
	cp -r kwin4_effect_grayscale "$pkgdir/usr/share/kwin/effects/"
	cp kwin4_effect_grayscale/metadata.json "$pkgdir/usr/share/kservices5/kwin/"
}
