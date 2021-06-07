# Maintainer: Mads Kjeldgaard <mail@madskjeldgaard.dk>
pkgname=flucoma-cli-git
pkgver=r128.940a7fa
pkgrel=2
pkgdesc="Fluid Corpus Manipulation Command line interface"
arch=('x86_64')
url="https://github.com/flucoma/flucoma-cli"
license=('BSD')
depends=()
makedepends=('cmake>=3.11' 'git' 'gcc' 'gcc-libs' )
optdepends=('python3: For documentation' 
		'python-jinja: For documentation' 
		'python-yaml: For documentation' 
		'python-docutils: For documentation')
provides=("${pkgname}")
conflicts=("flucoma-cli")
options=()
source=('flucoma-cli-git::git://github.com/flucoma/flucoma-cli.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname}"
	mkdir -p build && cd build
	cmake -DDOCS=OFF ..
	make 
}

package() {
	cd "$srcdir/${pkgname}"

	# Install binaries
	for F in $(ls bin); do install -Dm755 "bin/$F"  "$pkgdir/usr/bin/$F"; done
	# for F in $(ls docs); do install -Dm644 "docs/$F"  "$pkgdir/usr/share/doc/$pkgname/$F"; done
	install -Dm644 ./LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
