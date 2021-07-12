# Contributor: Andrey Kolchenko <andrey@kolchenko.me>

pkgname=rutoken-plugin
pkgver=4.5.5
pkgrel=2
pkgdesc="The Rutoken plugin is necessary for connecting USB devices with the browser, it allows you to identify devices and work with them."
arch=('i686' 'x86_64')
url="https://www.rutoken.ru/support/download/rutoken-plugin/"
license=('unknown')
makedepends=("findutils" "sed" "grep" "coreutils" "bash")

source_x86_64=("${pkgname}-${pkgver}.rpm::https://download.rutoken.ru/Rutoken_Plugin/${pkgver}.0/Linux/libnpRutokenPlugin-${pkgver}-1.x86_64.rpm")
sha256sums_x86_64=("1b7a8880653425c3e6ccff565f8ee9dded991bff35dc526f2394886f6cb7580b")
source_i686=("${pkgname}-${pkgver}.rpm::https://download.rutoken.ru/Rutoken_Plugin/${pkgver}.0/Linux/libnpRutokenPlugin-${pkgver}-1.i686.rpm")
sha256sums_i686=("ca9af2f16d1851a67c5803cc87f20bb5c29dcfb93fe9b9124c75d4b1702b0678")

package() {
	find "${srcdir}" -type d | sed "s#^${srcdir}#${pkgdir}#g" | tail -n +2 | xargs install -d
	eval $(find ${srcdir} -type f -exec bash -c 'echo install \"{}\" \"@$(dirname {})\"\;' \; | sed "s#@${srcdir}#${pkgdir}#g")
	eval $(find ${srcdir} -type l -exec bash -c 'echo ln -s \"$(readlink {})\" \"@{}\"\;' \; | grep -v '.rpm' |  sed "s#@${srcdir}#${pkgdir}#g")
}
