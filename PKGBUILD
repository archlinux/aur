# Maintainer: Adrian Carpenter <hello@nedrysoft.com>
pkgname=pingnoo
pkgver="2021.04.04"
pkgrel=1
epoch=
pkgdesc="An open-source cross-platform tool for ping/traceroute analysis."
arch=('x86_64')
url="https://www.pingnoo.com"
license=('GPL3')
groups=()
depends=('pcre2' 'libx11' 'libxcb' 'qt5-base' 'systemd-libs' 'libgpg-error' 'libpng' 'bzip2' 'libcap' 'freetype2' 'krb5' 'glib2' 'libxdmcp' 'qt5-declarative' 'gcc-libs' 'libgcrypt' 'md4c' 'double-conversion' 'graphite' 'zstd' 'pcre' 'icu' 'libglvnd' 'lz4' 'keyutils' 'harfbuzz' 'xz' 'openssl' 'libxau' 'glibc' 'zlib' 'e2fsprogs')
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
md5sums=('717347e1173fe92701b56dc3675a1d5e')
validpgpkeys=()
prepare=()

build() {
    cmake -B build -S ${pkgname} -DCMAKE_SKIP_RPATH=True -DPINGNOO_GIT_YEAR=2021 -DPINGNOO_GIT_MONTH=04 -DPINGNOO_GIT_DAY=04 -DPINGNOO_GIT_HASH=91703bf -DPINGNOO_GIT_BRANCH=develop -DPINGNOO_GIT_UNCOMMITTED=0
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
