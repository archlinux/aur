# Maintainer: Cilyan Olowen <gaknar@gmail.com>
pkgname=libnss-homehosts-git
pkgver=2.0.fd0bd7c
pkgrel=1
pkgdesc="Linux NSS library supporting per-user hosts resolution using \${XDG_CONFIG_HOME}/hosts or ~/.hosts"
arch=('i686' 'x86_64' 'arm')
url="https://github.com/bAndie91/libnss_homehosts"
license=('GPL')

depends=('glibc')
makedepends=('git')

provides=('libnss-homehosts=2.0')
conflicts=('libnss-homehosts')

source=(
    "git+https://github.com/bAndie91/libnss_homehosts.git"
    "Makefile-ldconfig.patch"
)

sha256sums=('SKIP'
            '56c590bd9d060d6b80dfc0f5464fce5cd727ec78c909b4e237eb16a246f407ea')

pkgver() {
  cd "libnss_homehosts"
  echo "2.0.$(git describe --always --long)"
}

prepare() {
	cd "libnss_homehosts"
	patch -p1 -i "$srcdir/Makefile-ldconfig.patch"
}

build() {
	cd "libnss_homehosts"
	make
}

package() {
	cd "libnss_homehosts"
    install -dm755 "$pkgdir/usr/lib"
	make INSTALL_FOLDER="$pkgdir/usr/lib" install
}
