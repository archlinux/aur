# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=flamegraph
pkgver=1.0
pkgrel=2
pkgdesc="Flame Graphs visualize profiled code"
arch=('i686' 'x86_64')
url="http://www.brendangregg.com/flamegraphs.html"
license=('CDDL')
depends=('awk' 'perl')
conflicts=('flamegraph' 'flamegraph-git')

source=("https://github.com/brendangregg/FlameGraph/archive/v${pkgver}.tar.gz")
sha256sums=('c5ba824228a4f7781336477015cb3b2d8178ffd86bccd5f51864ed52a5ad6675')

package() {
  _srcname=FlameGraph
  cd "${srcdir}/${_srcname}-${pkgver}"

  for execfile in ./*.{pl,awk}; do
    install -Dm755 "${execfile}" "${pkgdir}/usr/bin/${execfile}"
  done

  install -Dm755 jmaps "${pkgdir}/usr/bin/jmaps"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 docs/cddl1.txt "${pkgdir}/usr/share/licenses/${pkgname}/cddl1.txt"
}
