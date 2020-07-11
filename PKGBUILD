# Maintainer: Christoph Stahl <christoph.stahl@tu-dortmund.de>
pkgname=librnnoise-ladspa
_pkgname=noise-suppression-for-voice
pkgver=0.9
pkgrel=1
pkgdesc="Noise suppression plugin based on Xiph's RNNoise (LADSPA plugin for PulseAudio)"
arch=(any)
url="https://github.com/werman/noise-suppression-for-voice"
license=('GPL3')
makedepends=('cmake')
install=librnnoise-ladspa.install
source=("https://github.com/werman/${_pkgname}/archive/v${pkgver}.tar.gz"
        "size_t.patch")

sha256sums=('db42eb863082847ce58eeb9395eaaa7ccd84a0dd7153c35a614f35dd0967aab1'
            'a4a400464bfc0091757240f2a4adc289ee095cdbf266948e6ec72e00714ea53a')

prepare() {
	cd "$_pkgname-$pkgver"
	patch -p1 -i "$srcdir/size_t.patch"
}

build() {
	cd "$_pkgname-$pkgver"
    cmake -Bbuild-x64 -H. -DCMAKE_BUILD_TYPE=Release -DBUILD_VST_PLUGIN=OFF -DBUILD_LV2_PLUGIN=OFF
    cd build-x64
    make
}

package() {
	cd "$_pkgname-$pkgver"
    install -Dm755 build-x64/bin/ladspa/librnnoise_ladspa.so "$pkgdir/usr/lib/librnnoise_ladspa.so"
}

