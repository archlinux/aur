# Maintainer: seth <g3tchoo at proton dot me>

pkgname=lightmaputil-git
pkgver=r44.6b38f5d
pkgrel=1
pkgdesc="A simple command line utility to tell you if your lightmaps are too high resolution"
arch=('x86_64')
url="https://github.com/treacherousfiend/LightmapUtil"
license=('custom:none')
makedepends=('git' 'cmake') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/treacherousfiend/LightmapUtil")
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    ..
  make
}

package() {
	cd "$srcdir/${pkgname%-git}/build"
  make install DESTDIR="${pkgdir}"
}
