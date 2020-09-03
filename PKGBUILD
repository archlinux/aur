# Maintainer: Mads Kjeldgaard <mail@madskjeldgaard.dk>
pkgname=flucoma-cli-git
pkgver=r106.5b49c0a
pkgrel=1
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

	install -Dm755 ./bin/fluid-ampgate "$pkgdir/usr/bin/fluid-ampgate"
	install -Dm755 ./bin/fluid-ampslice "$pkgdir/usr/bin/fluid-ampslice"
	install -Dm755 ./bin/fluid-hpss "$pkgdir/usr/bin/fluid-hpss"
	install -Dm755 ./bin/fluid-loudness "$pkgdir/usr/bin/fluid-loudness"
	install -Dm755 ./bin/fluid-melbands "$pkgdir/usr/bin/fluid-melbands"
	install -Dm755 ./bin/fluid-mfcc "$pkgdir/usr/bin/fluid-mfcc"
	install -Dm755 ./bin/fluid-nmf "$pkgdir/usr/bin/fluid-nmf"
	install -Dm755 ./bin/fluid-noveltyslice "$pkgdir/usr/bin/fluid-noveltyslice"
	install -Dm755 ./bin/fluid-onsetslice "$pkgdir/usr/bin/fluid-onsetslice"
	install -Dm755 ./bin/fluid-pitch "$pkgdir/usr/bin/fluid-pitch"
	install -Dm755 ./bin/fluid-sines "$pkgdir/usr/bin/fluid-sines"
	install -Dm755 ./bin/fluid-spectralshape "$pkgdir/usr/bin/fluid-spectralshape"
	install -Dm755 ./bin/fluid-stats "$pkgdir/usr/bin/fluid-stats"
	install -Dm755 ./bin/fluid-transients "$pkgdir/usr/bin/fluid-transients"
	install -Dm755 ./bin/fluid-transientslice "$pkgdir/usr/bin/fluid-transientslice"

	install -Dm644 ./LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
