# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Denommus <yuridenommus@gmail.com>
# Contributor: Bill Fraser <wfraser@codewise.org>
# Contributor: Felipe Contreras <felipe.contreras@gmail.com>

pkgname=lib32-flex
pkgver=2.7.6
pkgrel=1
pkgdesc="A tool for generating text-scanning programs"
arch=('x86_64')
#url='http://flex.sourceforge.net'
url="https://github.com/westes/flex"
license=('custom:flex')
depends=('glibc')
depends=("${depends[@]/#/lib32-}")
depends+=("flex>=${pkgver}")
options=('!debug')
_srcdir="flex-$pkgver"
source=("https://github.com/westes/flex/releases/download/v$pkgver/flex-$pkgver.tar.gz")
sha256sums=('d7aedd600702e6a42d221f799bcd10c274254fbfafab49b6fb9c03573e3d92de')
validpgpkeys=('56D664C70CC2364CF5164914B7DFE8BB6C241FED'  # Flex Releases
              '56C67868E93390AA1039AD1CE4B29C8D64885307') # Will Estes

build() {
	cd "${_srcdir}"

	export CC='gcc -m32'
	export CXX='g++ -m32'
	export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

	./configure \
		--prefix='/usr' \
		--libdir='/usr/lib32'
	make
}

package() {
	cd "${_srcdir}"

	make DESTDIR="$pkgdir" install
	rm -rf "${pkgdir}"/usr/{include,share,bin}

	install -dm 755 "${pkgdir}"/usr/share/licenses
	ln -s flex "${pkgdir}"/usr/share/licenses/lib32-flex
}

# vim: ts=2 sw=2 et:
