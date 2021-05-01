# Maintainer: Adrian Carpenter <hello@nedrysoft.com>
pkgname=pingnoo
pkgver=2021.04.30
pkgrel=1
epoch=
pkgdesc="An open-source cross-platform tool for ping/traceroute analysis."
arch=('x86_64')
url="https://www.pingnoo.com"
license=('GPL3')
groups=()
depends=('libgpg-error' 'freetype2' 'qt5-declarative' 'zlib' 'pcre' 'systemd-libs' 'libxau' 'keyutils' 'md4c' 'pcre2' 'qt5-base' 'gcc-libs' 'harfbuzz' 'zstd' 'double-conversion' 'graphite' 'libxcb' 'libxdmcp' 'libgcrypt' 'krb5' 'libpng' 'glibc' 'glib2' 'bzip2' 'e2fsprogs' 'icu' 'libcap' 'lz4' 'openssl' 'libglvnd' 'xz' 'libx11')
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
source=('https://www.nedrysoft.com/downloads/pingnoo/source/pingnoo-2021.04.30.tar.gz')
noextract=()
md5sums=('25171382719b6fdf3777dfc3f99f7c99')
validpgpkeys=()
prepare=()

build() {
    cmake -B build -S ${pkgname} -DCMAKE_SKIP_RPATH=True -DPINGNOO_GIT_YEAR=2021 -DPINGNOO_GIT_MONTH=04 -DPINGNOO_GIT_DAY=30 -DPINGNOO_GIT_HASH=ba63d1d -DPINGNOO_GIT_BRANCH=develop -DPINGNOO_GIT_UNCOMMITTED=0
    make -j`nproc` -C build
}

package() {
    mkdir -p ${pkgdir}/usr/local/bin/pingnoo
    mkdir -p ${pkgdir}/etc/ld.so.conf.d
    mkdir -p ${pkgdir}/usr/share/icons/hicolor/512x512/apps
    mkdir -p ${pkgdir}/usr/share/applications

    cp -r pingnoo/bin/x86_64/Release/* ${pkgdir}/usr/local/bin/pingnoo
    cp pingnoo/pkg/pingnoo.conf ${pkgdir}/etc/ld.so.conf.d/pingnoo.conf
    cp pingnoo/src/app/images/appicon-512x512-.png ${pkgdir}/usr/share/icons/hicolor/512x512/apps/pingnoo.png
    cp pingnoo/installer/Pingnoo.desktop ${pkgdir}/usr/share/applications
}
