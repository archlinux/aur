# Maintainer: Adrian Carpenter <hello@nedrysoft.com>
pkgname=pingnoo
pkgver="2021.04.03"
pkgrel=1
epoch=
pkgdesc="An open-source cross-platform tool for ping/traceroute analysis."
arch=('x86_64')
url="https://www.pingnoo.com"
license=('GPL3')
groups=()
depends=('qt5-declarative' 'e2fsprogs' 'harfbuzz' 'libglvnd' 'libgcrypt' 'libcap' 'md4c' 'libpng' 'systemd-libs' 'openssl' 'pcre' 'glibc' 'libxcb' 'libxdmcp' 'zstd' 'lz4' 'libx11' 'xz' 'icu' 'gcc-libs' 'keyutils' 'double-conversion' 'qt5-base' 'libxau' 'pcre2' 'graphite' 'freetype2' 'glib2' 'zlib' 'krb5' 'libgpg-error' 'bzip2')
makedepends=('cmake' 'qt5-base' 'qt5-tools' 'qt5-quickcontrols' 'dbus')
checkdepends=()
optdepends=()
provides=("${pkgname}")
conflicts=()
replaces=()
backup=()
options=()
install="${pkgname}.install"
changelog=
source=("https://www.nedrysoft.com/downloads/${pkgname}/source/${pkgname}-${pkgver}.tar.gz")
noextract=()
md5sums=('272329a113a749f6628fecb32b188e43')
validpgpkeys=()
prepare=()

build() {
	cmake -B build -S ${pkgname} -DCMAKE_SKIP_RPATH=True
	make -C build
}

package() {
	mkdir -p ${pkgdir}/usr/local/bin/pingnoo
	mkdir -p ${pkgdir}/etc/ld.so.conf.d
	mkdir -p ${pkgdir}/usr/share/icons/hicolor/512x512/apps
	mkdir -p ${pkgdir}/usr/share/applications

	cp -r pingnoo/bin/x86_64/Release/* ${pkgdir}/usr/local/bin/pingnoo
	cp pingnoo/pkg/pingnoo.conf ${pkgdir}/etc/ld.so.conf.d/pingnoo.conf
	cp pingnoo/src/app/images/appicon-512x512-.png ${pkgdir}/usr/share/icons/hicolor/512x512/apps/pingnoo.png
	cp pingnoo/pkg/Pingnoo.desktop ${pkgdir}/usr/share/applications
}
