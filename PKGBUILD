# Maintainer: Jonas Malaco <jonas@protocubo.io>
# Contributor: wicastC <wicastchen at hotmail.com>

pkgname=flamegraph-git
pkgver=r316.a258e78
pkgrel=2
pkgdesc="Stack trace visualizer"
arch=('any')
url='http://www.brendangregg.com/FlameGraphs/cpuflamegraphs.html'
license=('CDDL')
depends=('perl' 'awk')
makedepends=('git')
provides=('flamegraph')
conflicts=('flamegraph' 'cargo-flamegraph')
source=("${pkgname}::git+https://github.com/brendangregg/FlameGraph")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}


package() {
	cd "$srcdir/$pkgname"

	for script in *.pl;
	do
		install -Dm 755 "${script}" "${pkgdir}/usr/bin/${script%.pl}"
	done

	install -Dm644 docs/cddl1.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
