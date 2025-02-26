# Maintainer: hizani

pkgname=qtox-toktok
_pkgname=qTox
pkgver=1.18.3
pkgrel=1
pkgdesc='Powerful Tox client written in C++/Qt (TokTok fork)'
arch=('x86_64')
url='https://github.com/TokTok/qTox'
license=('GPL3')
depends=('qt6-svg' 'tox' 'libexif' 'ffmpeg' 'qrencode' 'sqlcipher' 'openal')
optdepends=('sonnet>=6.0: spell checking support' 'xscreensaver>=1.2: auto-away status support')
makedepends=('base-devel' 'git' 'cmake' 'qt6-tools')
source=("git+https://github.com/TokTok/${_pkgname}.git")
sha512sums=('SKIP')

prepare() {
  cd $_pkgname
  git checkout -q tags/v${pkgver}
}

build() {
  cd $_pkgname
  cmake -B=_build \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DUPDATE_CHECK=OFF \
	-DCMAKE_BUILD_TYPE=Release
  make -j $(nproc) -C "_build"
}

check() {
  cd $_pkgname/_build
  make test
}

package() {
  cd $_pkgname/_build
  make DESTDIR="$pkgdir" install
}
