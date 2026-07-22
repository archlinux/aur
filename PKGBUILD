# Contributor: SanskritFritz (gmail)
# Contributor: Karol "Kenji Takahashi" Woźniak <kenji.sx>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=copyq-git
pkgver=r6880.2979d4bc
pkgrel=1
epoch=1
pkgdesc='Clipboard manager with searchable and editable history.'
url='https://github.com/hluk/CopyQ'
arch=('i686' 'x86_64')
license=('GPL-3.0')
depends=('qt6-svg' 'qt6-declarative' 'miniaudio')
makedepends=('git' 'extra-cmake-modules' 'qt6-tools')
optdepends=('kguiaddons: for better Wayland clipboard integration')
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
	      -DWITH_QCA_ENCRYPTION=OFF \
	      -DWITH_KEYCHAIN=OFF \
	      -DWITH_NATIVE_NOTIFICATIONS=OFF \
	      -DMINIAUDIO_INCLUDE_DIR='/usr/include/miniaudio' $srcdir/$pkgname
	make
}

package() {
	cd "$srcdir/$pkgname/build"
	make DESTDIR="$pkgdir" install
}
