# Maintainer: sgar <swhaat in github>

pkgname=veyon
pkgver=4.8.1
pkgrel=1
pkgdesc="Open Source computer monitoring and classroom management"
arch=('i686' 'x86_64')
url="https://github.com/veyon"
license=('GPLv2')
depends=('qt5-base'
	'libfakekey'
	'kitemmodels'
	'libxcomposite'
	'qca'
	'libxrandr'
	'libxtst'
	'pam'
	'openldap'
	'openssl'
	'libjpeg-turbo'
	'zlib' 'qca-qt5'
	'libqtxdg'
	'lzo'
	'libxinerama'
	'libsasl'
	'x11vnc')
optdepends=('kldap: KDE support')
makedepends=('git' 'gcc' 'cmake' 'qt5-tools' 'procps-ng' 'kldap' 'libprocps')
_commit="637f0d040aa19bd68aa5e1f1060a65e42a65c46b"
source=("git+${url}/veyon.git#commit=${_commit}")
sha256sums=('SKIP')

prepare() {
    mkdir -p build

    cd "${srcdir}/${pkgname}"
    git submodule update --init

    cd "${srcdir}/${pkgname}/3rdparty/qthttpserver/"
    git submodule update --init
}

build() {
  cmake -B build -S "$pkgname" \
    -DCMAKE_BUILD_TYPE='RelWithDebInfo' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DSYSTEMD_SERVICE_INSTALL_DIR='/usr/lib/systemd/system' \
    -Wno-dev
  cmake --build build
}

package_veyon() {
    DESTDIR="$pkgdir" cmake --install build
}
