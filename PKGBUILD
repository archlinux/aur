# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=qactus
pkgver=1.0.0
pkgrel=1
pkgdesc='A Qt-based OBS notifier application'
arch=(x86_64)
url='https://github.com/javierllorente/qactus'
license=(GPL2 GPL3)
depends=(desktop-file-utils gtk-update-icon-cache qtkeychain)
source=("$pkgname-$pkgver.tar.gz::https://github.com/javierllorente/qactus/archive/v$pkgver.tar.gz"
        0001-Fix-issue-4-Protocol-is-unknown-during-login.patch)
sha256sums=('5a4b748983b4c45653e2298a6282b53ff81766502f841f1709ffbe1b8f7db976'
            'a1264c32f4ceb91343b3e70dbae39e0e9300740351899088d588ae45bffbbc31')

prepare() {
  cd qactus-$pkgver
  sed -i "s/lib64/lib/g" src/qobs/qobs.pro
  patch -Np1 -i ../0001-Fix-issue-4-Protocol-is-unknown-during-login.patch
}

build() {
  cd qactus-$pkgver
  qmake-qt5 PREFIX=/usr qactus.pro
  make
}

package() {
  make -C qactus-$pkgver INSTALL_ROOT="${pkgdir}" install
}
