# Maintainer: Benjamin Bukowski <b at bkwsk dot de>
pkgname=krunner-firefox-git
pkgver=r102.b9215bc
pkgrel=1
pkgdesc="Launch Firefox profiles from Krunner and your normal launcher."
arch=('x86_64')
url="https://github.com/alex1701c/krunner-firefox"
license=('GPL3')
depends=('firefox')
makedepends=('cmake' 'extra-cmake-modules' 'kcmutils')
optdepends=('proxychains-ng: Launch specific profiles over a proxy')
source=("$pkgname::git+https://github.com/alex1701c/krunner-firefox.git" 'private_browsing_firefox.svg')
sha256sums=('SKIP'
            'fd7611210dc81105c6b8c92f77f332549f697c61efa6d5dd9e60eaff2dc8d067')

pkgver() {
	cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cmake -B build -S "${pkgname}" \
		    -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TESTING=OFF

    cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
	install -Dm644 private_browsing_firefox.svg -t "${pkgdir}/usr/share/pixmaps"
}

