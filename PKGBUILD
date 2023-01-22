# Maintainer: Gimmeapill <gimmeapill at gmail dot com>

pkgname=guitarix.vst-git
pkgver=Latest.r0.g6bd494c
pkgrel=1
pkgdesc="virtual versatile amplification for Jack/Linux - vst3 wrapper"
arch=('x86_64')
url="https://github.com/brummer10/guitarix.vst"
license=('GPL3')
groups=('vst-plugins' 'pro-audio')
depends=('guitarix' 'jack' 'gtkmm3' 'liblo' 'liblrdf' 'libsndfile' 'lilv' 'bluez-libs' 'boost-libs' 
'zita-convolver' 'zita-resampler' 'ttf-roboto')
makedepends=('git' 'boost' 'eigen' 'gperf' 'intltool' 'ladspa' 'lv2' 'waf' 'sassc' 'pkgconfig' 'webkit2gtk')
provides=('guitarix.vst')
source=("${pkgname%-*}::git+https://github.com/brummer10/guitarix.vst")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  git describe --long --tags | sed -r 's/^V//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-*}"
	git submodule init
	git submodule update
	make
}

package() {
	cd "$srcdir/${pkgname%-*}"
	make JUCE_VST3DESTDIR="$pkgdir/usr/lib/vst3/" install
}
