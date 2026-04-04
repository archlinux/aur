# Maintainer: aurrrrrr <no email>

pkgname=deepfilternet-plugin-pipewire-bin
pkgver=0.5.6
pkgrel=5
#epoch=
pkgdesc="Noise supression using deep filtering, also works for easyeffects"
arch=(x86_64 aarch64 armv7h)
url="https://github.com/Rikorose/DeepFilterNet"
license=('Apache-2.0' 'MIT')
depends=(pipewire)
provides=('libdeep_filter_ladspa.so')
install=deepfilternet-plugin-pipewire-bin.install
source=(
	# this also includes the manual install instructions
	"https://raw.githubusercontent.com/Rikorose/DeepFilterNet/refs/tags/v${pkgver}/ladspa/filter-chain-configs/deepfilter-mono-source.conf"
	"https://raw.githubusercontent.com/Rikorose/DeepFilterNet/refs/tags/v${pkgver}/LICENSE"
	"https://raw.githubusercontent.com/Rikorose/DeepFilterNet/refs/tags/v${pkgver}/LICENSE-MIT"
	"https://raw.githubusercontent.com/Rikorose/DeepFilterNet/refs/tags/v${pkgver}/LICENSE-APACHE"
)
_source=("libdeep_filter_ladspa.so::https://github.com/Rikorose/DeepFilterNet/releases/download/v${pkgver}/libdeep_filter_ladspa-${pkgver}-${CARCH}-unknown-linux-gnu.so")
source_x86_64=(${_source[@]})
source_aarch64=(${_source[@]})
source_armv7h=("libdeep_filter_ladspa.so::https://github.com/Rikorose/DeepFilterNet/releases/download/v${pkgver}/libdeep_filter_ladspa-${pkgver}-armv7-unknown-linux-gnueabihf.so")
#                                                                                                                                                ^^^^^               ^^^^^^^^^
# differences found between armv7h and armv7 release binaries______________________________________________________________________________________|_____________________|

sha256sums=('af141e1ef5a5c5762bc440b1dcfe77039480b150a24a391a43e8c109f8167ed2'
            'f7ef673bf046d823dcd775bdd0768432bd8855f81d0e5e1290a0a48c42e2dca3'
            '24e6bb09c928af8d8e56268082f87413247ce36b39dd5d33add2f9893968065e'
            '1eaee808c5fb6b4e895ba30425285a5cdc5dd25bba2cd230f264c2200c331aec')
sha256sums_x86_64=('2ca3205c2911d389604a826a240e745597d50252b5cab81c8248252b335e2236')
sha256sums_aarch64=('7b1fe31e41a4b447e2c7a6fd46397b7cd4456d6acb5a011d4ea125cb9612041e')
sha256sums_armv7h=('b9fb1b26ae2d555d98a1c144eebdf62ea6ab1678afa61e658ee3eed380951b1c')

package() {
	install -D -t $pkgdir/etc/pipewire/filter-chain.conf.d/ --mode=644 deepfilter-mono-source.conf
	install -D -t $pkgdir/usr/lib/ladspa --mode=755 libdeep_filter_ladspa.so
	install -D -t $pkgdir/usr/share/licenses/$pkgname --mode 644 LICENSE*
}

