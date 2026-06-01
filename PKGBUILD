# Maintainer: George Hu <integral@archlinux.org>

pkgname=plasma-ions-china
pkgver=0.1.0
_kdeplasma_addons_ver=6.5.5
pkgrel=1
pkgdesc="A collection of KDE Plasma weather data sources for Chinese users"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/arenekosreal/${pkgname}"
license=('GPL-3.0-or-later')
depends=('glibc' 'kcoreaddons' 'kdeplasma-addons>=6.5.0' 'ki18n' 'libstdc++' 'qt6-base')
makedepends=('cmake' 'extra-cmake-modules')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
	"https://download.kde.org/stable/plasma/${_kdeplasma_addons_ver}/kdeplasma-addons-${_kdeplasma_addons_ver}.tar.xz")
noextract=("kdeplasma-addons-${_kdeplasma_addons_ver}.tar.xz")
sha256sums=('d4412b6f29a133c5f8d3a07984245c96d6906370a6a76c154fcce275f80885a3'
            '32b69b987258998b95017cf08aba1d85b986303bd59e1bbc600ed12e2184f5cb')

build() {
	cmake -B build \
		-S "${pkgname}-${pkgver}" \
		-D CMAKE_BUILD_TYPE=None \
		-D EXTERNAL_PROJECT_URL_KDEPLASMA_ADDONS="file://${srcdir}/kdeplasma-addons-${_kdeplasma_addons_ver}.tar.xz"

	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
}
