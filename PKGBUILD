# Maintainer: <alienchuj@gmail.com>
# Maintainer: Lancia Greggori <lanciagreggori@gmail.com>

pkgname='metalog-git'
pkgver=r16.3e3a494
pkgrel=3
pkgdesc='A meta-template style log system for C++'
arch=('any')
url='https://github.com/Sleeplessy/metalog'
license=('Apache')
makedepends=('cmake' 'git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
	cd "$pkgname"
	[ -e build ] && rm -rf build
	mkdir build && cd build
	cmake -DCMAKE_INSTALL_PREFIX="/usr" .. && make
}

package()
{
	cd "$pkgname/build"
	make install DESTDIR="$pkgdir/"
}
