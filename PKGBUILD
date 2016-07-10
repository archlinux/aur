# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: Jack L. Frost <fbt@fleshless.org>
# Contributor: Corelli <corelli AT sent DOT com>
# Contributor: BartÅ‚omiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: intelfx <intelfx100 [at] gmail [dot] com>
# Contributor: Behem0th <grantipak@gmail.com> 
# Contributor: zman0900 <zman0900@gmail.com>

pkgname=freshplayerplugin-git
pkgver=0.3.5.r24.gc0510ba
pkgrel=1
pkgdesc='PPAPI-host NPAPI-plugin adapter.'
arch=('i686' 'x86_64')
url='https://github.com/i-rinat/freshplayerplugin'
license=('MIT')
depends=('pango' 'alsa-lib' 'freetype2' 'libevent' 'libgl' 'v4l-utils' 'ffmpeg' 'icu' 'libxrandr' 'libxcursor')
makedepends=('cmake' 'ragel' 'git')
conflicts=('freshplayerplugin')
source=("${pkgname}::git+${url}")
install="${pkgname}.install"
sha1sums=('SKIP')

optdepends=(
	'chromium-pepper-flash: for the necessary Pepper plugin'
	'chromium-pepper-flash-standalone: for the necessary Pepper plugin'
	'google-chrome: for the necessary Pepper plugin'
	'google-chrome-beta: for the necessary Pepper plugin'
	'google-chrome-dev: for the necessary Pepper plugin'
)

pkgver() {
	cd "$pkgname"
  git describe --tags | sed -e 's:v::' -e 's:-:.r:' -e 's:-:.:g'
}

build() {
	cd "$pkgname"
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="${pkgdir}" install

	install -Dm644 data/freshwrapper.conf.example "${pkgdir}/usr/share/${pkgname}/freshwrapper.conf.example"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
