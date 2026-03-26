# Contributor: SanskritFritz (gmail)
# Contributor: Karol "Kenji Takahashi" Woźniak <kenji.sx>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=copyq-git
pkgver=r6765.15dafab2
pkgrel=1
epoch=1
pkgdesc='Clipboard manager with searchable and editable history.'
url='https://github.com/hluk/CopyQ'
arch=('i686' 'x86_64')
license=('GPL-3.0')
depends=('hicolor-icon-theme' 'qt6-svg' 'qt6-wayland' 'knotifications' 'kstatusnotifieritem' 'miniaudio')
makedepends=('git' 'extra-cmake-modules' 'qt6-tools')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr \
	      -DWITH_QCA_ENCRYPTION=FALSE \
	      -DWITH_KEYCHAIN=FALSE \
	      -DMINIAUDIO_INCLUDE_DIR='/usr/include/miniaudio' \
	      -DWITH_QT6=TRUE $srcdir/$pkgname
	make
}

package() {
	cd "$srcdir/$pkgname/build"
	make DESTDIR="$pkgdir" install
}
