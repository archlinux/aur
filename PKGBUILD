# Maintainer: Augugrumi <augugrumi@gmail.com>
pkgname=libviface-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=v1.1.1
pkgrel=4
pkgdesc="Fork of the official libviface package. C++ bindings for Linux tun/tap and netdevice interface."
arch=('x86_64')
url="https://github.com/Augugrumi/libviface"
license=('APACHE')
groups=('linux-tools')
depends=()
optdepends=('libtins: packets manipulation'
            'gcc-libs: additional gcc support')
makedepends=(git cmake) # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
replaces=()
backup=()
options=()
source=("${pkgname%-git}::git://github.com/Augugrumi/libviface.git")
noextract=()
md5sums=('SKIP')
srcdir=()

pkgver() {
	cd "$srcdir/${pkgname%-git}"
  printf "%s" "$(git describe --tags)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  rm -Rf ./build/
  mkdir ./build/
  cd ./build/
  cmake -DCMAKE_INSTALL_PREFIX=/usr/ ..
  make
}

package() {
	cd "$srcdir/${pkgname%-git}/build/"
	make DESTDIR="$pkgdir/" install/strip
}
