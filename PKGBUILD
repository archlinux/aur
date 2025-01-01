# Maintainer: Francis Banyikwa <mhogomchungu@gmail.com>
pkgname=sirikali
_name=SiriKali
pkgver=1.8.0
pkgrel=1
pkgdesc="A Qt/C++ GUI front end to sshfs, ecryptfs-simple, cryfs, gocryptfs, securefs, fscrypt and encfs"
arch=('i686' 'x86_64' 'aarch64')
url="https://mhogomchungu.github.io/sirikali/"
license=('GPL')
depends=('qt6-base' 'libpwquality' 'hicolor-icon-theme')
makedepends=('cmake' 'libgcrypt' 'gcc-libs')
optdepends=('lxqt_wallet: use an external lxqt_wallet (must recompile)'
            'libsecret: support for Gnome libsecret password storage (must recompile)'
            'kwallet: support for KDE wallet storage (must recompile)'
            'cryfs: for CryFS backend'
            'ecryptfs-simple: for eCryptfs backend'
            'encfs: for EncFS backend'
            'fscrypt: for fscrypt backend'
            'gocryptfs: for gocryptfs backend'
            'securefs: for securefs backend'
            'sshfs: for SSHFS backend')
conflicts=("sirikali-git")
source=("${_name}-${pkgver}.tar.xz::https://github.com/mhogomchungu/${pkgname}/releases/download/${pkgver}/${_name}-${pkgver}.tar.xz"
        "${_name}-${pkgver}.tar.xz.asc::https://github.com/mhogomchungu/${pkgname}/releases/download/${pkgver}/${_name}-${pkgver}.tar.xz.asc")
sha256sums=('e5a05110d2df91fe317e12ca4e07f797dc70732436c9fc8dd4bdca2f5a49bc32'
            'SKIP')
validpgpkeys=('6855E493B5B2DF96E319BB6D16E2E1ACC6F51242')

prepare() {
  cd "$srcdir/${_name}-${pkgver}"
  mkdir -p build
}

build() {
  cd "$srcdir/${_name}-${pkgver}/build"
  cmake \
    -DCMAKE_BUILD_TYPE=RELEASE \
    -DBUILD_WITH_QT6=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DINTERNAL_LXQT_WALLET=true \
    -DNOKDESUPPORT=true \
    . ..
  make
}

package() {
  cd "$srcdir/${_name}-${pkgver}/build"
  make DESTDIR="$pkgdir/" install
}
