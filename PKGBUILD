# Maintainer: zerkawei <zkw@zerkawei.fr>
pkgname=beeflang-git
pkgver=r5670.1f27419
pkgrel=1
pkgdesc="High-performance multi-paradigm programming language focused on developer productivity"
arch=(x86_64)
url="https://www.beeflang.org/"
license=('MIT')

depends=('llvm-libs>=22.0.0' 'gcc-libs' 'glibc')
makedepends=('llvm>=22.0.0' 'cmake>=3.15' 'ninja' 'git')
provides=('beeflang=${pkgver}')
conflicts=('beeflang')

options=(!buildflags)

source=('git+https://github.com/beefytech/Beef.git')
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/Beef"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "${srcdir}/Beef"
	bin/build.sh package
}

package() {
	cd "${srcdir}/Beef"

	bin/install.sh "${pkgdir}/opt/BeefLang"

	install -d "${pkgdir}/usr/bin"
	ln -s "/opt/BeefLang/bin/BeefBuild" "${pkgdir}/usr/bin/beefbuild"

	install -d "${pkgdir}/usr/share/licenses/beeflang-git"
	ln -s "/opt/BeefLang/LICENSES.TXT" "${pkgdir}/usr/share/licenses/beeflang-git/LISENCE"
}
