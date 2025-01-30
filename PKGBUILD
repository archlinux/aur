# Maintainer: jakka <jakkadoujin at gmail dot com>

pkgname=hydownloader-systray-git
pkgver=r140.a350429
pkgrel=1
pkgdesc="Remote management GUI for hydownloader"
arch=('i686' 'x86_64')
url="https://gitgud.io/thatfuckingbird/hydownloader-systray"
depends=(
	'qt6-base'	
)
makedepends=(
	'cmake'
	'qt6-tools'
	'qt6-base'
	'git'
)
provides=('hydownloader-systray')
license=('GNU AGPL')
source=(
    "$pkgname"::"git+https://gitgud.io/thatfuckingbird/hydownloader-systray.git"
    "hydownloader-systray.desktop"
)
sha512sums=('SKIP'
            '1f2a094a32cdb88751c7b1ea2e2babaca361eface09c8ec34c79fba68dfa61f33b40bad780cba9bdde62a2c0a81886e01a69ac39cb7e8bd28e52c85e1512fd21')
optdepends=(
    'hydownloader-git: Alternative download system for Hydrus'
    'hydrus: Danbooru-like image tagging and searching system for the desktop'
)

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  git submodule update --init
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release .
  make
}

package() {
 cd "$srcdir/$pkgname"
 DESTDIR="$pkgdir" make install
 install -d -m755 "${pkgdir}/usr/share/applications"
 install -m644 "../hydownloader-systray.desktop" "${pkgdir}/usr/share/applications/hydownloader-systray.desktop"
 install -Dm644 "./icon/hydownloader-systray.png" "${pkgdir}/usr/share/icons/hydownloader-systray.png"
}
