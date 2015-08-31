# Maintainer: Shanto <shanto@hotmail.com>
# Maintainer: Maarten de Boer <maarten@ikfixjewebstek.nl>

pkgname=fontconfig-infinality
pkgver=2.11.94
pkgrel=1
pkgdesc="Fontconfig is a library for configuring and customizing font access, patched with infinality patches."
arch=(i686 x86_64)
license=('GPL')
url="https://github.com/bohoomil/fontconfig-ultimate"
depends=('freetype2-infinality')
conflicts=('fontconfig')
provides=("fontconfig=$pkgver")
options=('!libtool')
install='install.sh'
source=(
	"http://www.freedesktop.org/software/fontconfig/release/fontconfig-${pkgver}.tar.bz2"
	"01-configure.patch"
	"02-configure.ac.patch"
	"03-Makefile.in.patch"
	"04-Makefile.conf.d.patch"
	"05-Makefile.am.in.patch"
	"conf.d.infinality.tar.xz"
	"presets.tar.xz"
)
sha256sums=('d763c024df434146f3352448bc1f4554f390c8a48340cef7aa9cc44716a159df'
            'dd8d5ee295003982a783aaa57307f507889216c53856f8355a1b83e836c92ec5'
            'dff6e1e1561a5d094b9906efb8b0ac06cd652c6a19eab3cde06c314a7b3f92eb'
            '3daa2e2db611fb13342cdb511c344c12847ab669d050823c1cf40c4de863eff7'
            '16f8b2fe38ba7dc921825b8d5a54248804c390ab6773830bc39394dd91a4d9ec'
            '024dac82d87171c7c53b852ae97b563f4f70c6d2079921f8b0f16fa811eb93d5'
            'd8eb772ac556d2a8d62a203afbb261110f236cce8b283e80bae3cc2350c32d80'
            'ddbc1bea23161f6b32680ee45092f7b5f2d53aeb01730db38f686cb68786c672')

build() {
	cd "${srcdir}/fontconfig-${pkgver}"

	patch -Np1 -i ../01-configure.patch
	patch -Np1 -i ../02-configure.ac.patch
	patch -Np1 -i ../03-Makefile.in.patch
	patch -Np1 -i ../04-Makefile.conf.d.patch
	patch -Np1 -i ../05-Makefile.am.in.patch

	ln -s ../conf.d.infinality

	autoreconf
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/fontconfig-${pkgver}"

	# Install fontconfig
	make DESTDIR="${pkgdir}" install

	# Install presets
	install -Dm 755 "${srcdir}/presets/combi/30-metric-aliases-combi.conf" "${pkgdir}/etc/fonts/conf.avail.infinality/combi/30-metric-aliases-combi.conf"
	install -Dm 755 "${srcdir}/presets/combi/37-repl-global-combi.conf" "${pkgdir}/etc/fonts/conf.avail.infinality/combi/37-repl-global-combi.conf"
	install -Dm 755 "${srcdir}/presets/combi/60-latin-combi.conf" "${pkgdir}/etc/fonts/conf.avail.infinality/combi/60-latin-combi.conf"
	install -Dm 755 "${srcdir}/presets/combi/65-non-latin-combi.conf" "${pkgdir}/etc/fonts/conf.avail.infinality/combi/65-non-latin-combi.conf"
	install -Dm 755 "${srcdir}/presets/combi/66-aliases-wine-combi.conf" "${pkgdir}/etc/fonts/conf.avail.infinality/combi/66-aliases-wine-combi.conf"
	install -Dm 755 "${srcdir}/presets/free/30-metric-aliases-free.conf" "${pkgdir}/etc/fonts/conf.avail.infinality/free/30-metric-aliases-free.conf"
	install -Dm 755 "${srcdir}/presets/free/37-repl-global-free.conf" "${pkgdir}/etc/fonts/conf.avail.infinality/free/37-repl-global-free.conf"
	install -Dm 755 "${srcdir}/presets/free/60-latin-free.conf" "${pkgdir}/etc/fonts/conf.avail.infinality/free/60-latin-free.conf"
	install -Dm 755 "${srcdir}/presets/free/65-non-latin-free.conf" "${pkgdir}/etc/fonts/conf.avail.infinality/free/65-non-latin-free.conf"
	install -Dm 755 "${srcdir}/presets/free/66-aliases-wine-free.conf" "${pkgdir}/etc/fonts/conf.avail.infinality/free/66-aliases-wine-free.conf"
	install -Dm 755 "${srcdir}/presets/ms/30-metric-aliases-ms.conf" "${pkgdir}/etc/fonts/conf.avail.infinality/ms/30-metric-aliases-ms.conf"
	install -Dm 755 "${srcdir}/presets/ms/37-repl-global-ms.conf" "${pkgdir}/etc/fonts/conf.avail.infinality/ms/37-repl-global-ms.conf"
	install -Dm 755 "${srcdir}/presets/ms/60-latin-ms.conf" "${pkgdir}/etc/fonts/conf.avail.infinality/ms/60-latin-ms.conf"
	install -Dm 755 "${srcdir}/presets/ms/65-non-latin-ms.conf" "${pkgdir}/etc/fonts/conf.avail.infinality/ms/65-non-latin-ms.conf"
	install -Dm 755 "${srcdir}/presets/ms/66-aliases-wine-ms.conf" "${pkgdir}/etc/fonts/conf.avail.infinality/ms/66-aliases-wine-ms.conf"

	# Install presets switcher
	install -m 755 "${srcdir}/presets/fc-presets" "${pkgdir}/usr/bin/fc-presets"
}

