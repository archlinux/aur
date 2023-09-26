# Maintainer: Carl Kittelberger <icedream@icedream.pw>

pkgname=obs-kmsgrab-git
pkgver=r24.4fbb919
pkgrel=1
pkgdesc="\"Zero-copy\" Linux screen capture plugin for OBS that uses libdrm and dmabuf"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/rhenium/obs-kmsgrab"
license=('GPL2')
depends=('obs-studio' 'libdrm')
makedepends=('git' 'cmake' 'ninja')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/rhenium/obs-kmsgrab.git"
        fix-DRM-include-dirs.patch)
sha256sum=('SKIP')

pkgver() {
        cd "$srcdir/${pkgname%-git}"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	patch -p1 -i "${srcdir}/fix-DRM-include-dirs.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	cmake . -GNinja -DCMAKE_INSTALL_PREFIX=/usr
	ninja
}

package() {
	DESTDIR="$pkgdir" ninja -C "$srcdir/${pkgname%-git}" install
}
sha512sums=('SKIP'
            'd3b3d3e6e2e3baccbdd13d3af6c549ecd014f921ddd3ff9b93c1c4c12096659735ed8d1fbd4440129aead325427329f36305847d08a4c696b26e7c4bb1004a6c')
sha384sums=('SKIP'
            '84d79204d44323e8865f19ccd4212a45d01809497a124d40373e05eab8747c986679bfcdffef25de1401b9bef0cf3674')
sha256sums=('SKIP'
            'a1be9c2cada748dcfa72d50093dd05e868aedf6a7f8f90f9ecd636d39b5d438e')
sha1sums=('SKIP'
          'ac3ab494a2ca6502e2dfaf486370ffda6189b4e6')
md5sums=('SKIP'
         '12f839d514c3883cfdcdb019317d84fe')
