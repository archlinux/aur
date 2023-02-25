# Maintainer: Gimmeapill <gimmeapill at gmail dot com>

pkgname=guitarix.vst-git
pkgver=Latest.r0.gcf94bd3
pkgrel=1
pkgdesc="virtual versatile amplification for Jack/Linux - vst3 wrapper"
arch=('x86_64')
url="https://github.com/brummer10/guitarix.vst"
license=('GPL3')
groups=('vst-plugins' 'pro-audio')
#depends=('liblrdf' 'libsndfile' 'lilv' 'boost-libs' 'fftw' 'freetype2' 'glibmm' 'avahi')
depends=('libsndfile' 'lilv' 'fftw' 'freetype2' 'glibmm' 'avahi')
#makedepends=('git' 'boost' 'eigen' 'gperf' 'intltool' 'ladspa' 'lv2' 'waf' 'sassc' 'pkgconfig' 'webkit2gtk' 'glib2')
makedepends=('git' 'boost' 'eigen' 'gperf' 'intltool' 'lv2' 'waf' 'sassc' 'pkgconfig' 'webkit2gtk')
optdepends=(
  'vst3-host: for VST3 plugins'
  'gxplugins.lv2: for Guitarix LV2 plugins'
)
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
