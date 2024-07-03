# Maintainer: Uffe Jakobsen <uffe@uffe.org>

pkgname=numatop
pkgver=2.3
pkgrel=2
pkgdesc="Observation tool for NUMA systems"
arch=('i686' 'x86_64')
url="https://github.com/intel/numatop"
license=('BSD-3-Clause')
depends=('numactl' 'ncurses' 'check')
source=("https://github.com/intel/numatop/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1bec45a2388c255bd9c65dbc12bb29173c4196e3f4cfa3ca3e8c96647d675e16')
#sha256sums=('SKIP')

prepare()
(
	cd "${srcdir}/${pkgname}-${pkgver}"
  ./autogen.sh
  #./configure
)

build()
{
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
	gzip -c numatop.8 > numatop.8.gz
}

package()
{
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -D --mode=0755 numatop "${pkgdir}/usr/bin/numatop"
	install -D --mode=0644 numatop.8.gz "${pkgdir}/usr/share/man/man8/numatop.8.gz"
	install -D --mode=0644 COPYING "${pkgdir}/usr/share/licenses/numatop/LICENSE"
}
