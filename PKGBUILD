# Maintainer: João Figueiredo <jf dot mundox at gmail dot com> 

pkgname=non-euclidean-git
pkgver=r8.e09f089
pkgrel=1
pkgdesc="Tiny Non-Euclidean engine"
arch=('any')
url="https://github.com/CzechBlueBear/NonEuclidean"
license=('MIT')
depends=('glew' 'sdl2')
makedepends=('git')
source=('git+https://github.com/CzechBlueBear/NonEuclidean.git')
sha256sums=('SKIP')

pkgver() {
	cd $srcdir/NonEuclidean/NonEuclidean
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $srcdir/NonEuclidean/NonEuclidean
	make
}

package() {
	cd $srcdir/NonEuclidean/
	install -Dm755 NonEuclidean/NonEuclidean "$pkgdir/opt/NonEuclidean/NonEuclidean"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -d "$pkgdir/opt/NonEuclidean/Meshes"
	install -d "$pkgdir/opt/NonEuclidean/Shaders"
	install -d "$pkgdir/opt/NonEuclidean/Textures"
	install -Dm644 NonEuclidean/Meshes/* "$pkgdir/opt/NonEuclidean/Meshes/"
	install -Dm644 NonEuclidean/Shaders/* "$pkgdir/opt/NonEuclidean/Shaders/"
	install -Dm644 NonEuclidean/Textures/* "$pkgdir/opt/NonEuclidean/Textures/"
	install -d "$pkgdir/usr/bin/"
	cat << EOF > "$pkgdir/usr/bin/NonEuclidean"
#!/bin/bash
cd /opt/NonEuclidean
./NonEuclidean
EOF
	chmod 755 "$pkgdir/usr/bin/NonEuclidean"
}
