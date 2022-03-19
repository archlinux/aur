# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com >
# Based on corebird-non-streaming-git PKGBUILD

pkgname=cawbird-git
_pkgname=cawbird
pkgver=1.5.r0.g0a60a0bc38
pkgrel=1
pkgdesc="A fork of the Corebird GTK Twitter client that continues to work with Twitter"
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/ibboard/cawbird/"
depends=('gspell' 'gstreamer' 'liboauth')
optdepends=('noto-fonts-emoji: Emoji support')
makedepends=('vala' 'git' 'meson' 'intltool')
provides=('corebird')
conflicts=('corebird' 'corebird-git' 'corebird-non-streaming-git')
source=("${pkgname}::git+https://github.com/IBBoard/cawbird.git")
sha1sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c2-48

}

build() {
  cd ${pkgname}

  meson builddir \
        --prefix=/usr \
        --buildtype=release \
        -D consumer_key_base64=YUVNOE14dE5xMVdHRzl2emo5SzNNSlNUeg== \
        -D consumer_secret_base64=c0J0cmc2clNJTFN6bHlSbFNXc2J1MmdvWWk3b0FzTGZHOGI4OG5QRzB3Tmx1Y0ZtOHQ=
  ninja -C builddir
}

package() {
  cd ${pkgname}

  DESTDIR="${pkgdir}" ninja -C builddir install
}
