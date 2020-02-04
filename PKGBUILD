# Maintainer: Kilian Guillaume "cafehaine" <kilian dot guillaume at gmail dot com>
pkgname=almond
pkgrel=1
pkgver=0.9.1
_scalaver=2.13.1
pkgdesc="A scala kernel for Jupyter"
arch=('x86_64')
url="https://almond.sh/"
license=('BSD')
depends=('jupyter' 'scala')
makedepends=()
source=("https://git.io/coursier-cli" "kernel.json")
md5sums=('SKIP' 'SKIP')

package() {
	cd "$srcdir"
	export SCALA_VERSION=$_scalaver
	export ALMOND_VERSION=$pkgver
	export COURSIER_CACHE=$(pwd)/.coursier-cache
	chmod +x coursier-cli
	./coursier-cli bootstrap \
	    -r jitpack \
	    -i user -I user:sh.almond:scala-kernel-api_$SCALA_VERSION:$ALMOND_VERSION \
	    sh.almond:scala-kernel_$SCALA_VERSION:$ALMOND_VERSION \
	    -o almond
	./almond --install --jupyter-path "$pkgdir/usr/share/jupyter/kernels/"
	install -Dm644 kernel.json -t "$pkgdir/usr/share/jupyter/kernels/scala/"
}

