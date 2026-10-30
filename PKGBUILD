# Maintainer: hyperpuncher
pkgname=nemo-speech-vulkan-nightly-bin
pkgver=20261030.094904
pkgrel=1
_release=nightly
pkgdesc='Native speech recognition, synthesis, and translation with Vulkan support (nightly)'
arch=('x86_64' 'aarch64')
url='https://github.com/NVIDIA/NeMo-Speech.cpp'
license=(
	'Apache-2.0'
	'BSD-3-Clause'
	'MIT'
	'MIT-0'
	'GPL-3.0-or-later WITH GCC-exception-3.1'
)
depends=('glibc' 'gcc-libs' 'vulkan-icd-loader' 'vulkan-driver')
optdepends=(
	'curl: model downloads'
	'alsa-lib: microphone capture through ALSA'
	'libpulse: microphone capture through PulseAudio'
	'jack: microphone capture through JACK'
)
provides=("nemo-speech=${pkgver}")
conflicts=('nemo-speech')
options=('!strip' '!debug')
source_x86_64=("nemo-speech-${pkgver}-linux-x86_64-vulkan.tar.gz::${url}/releases/download/${_release}/nemo-speech-${_release}-linux-x86_64-vulkan.tar.gz")
source_aarch64=("nemo-speech-${pkgver}-linux-aarch64-vulkan.tar.gz::${url}/releases/download/${_release}/nemo-speech-${_release}-linux-aarch64-vulkan.tar.gz")
sha256sums_x86_64=('61731ff06a1fa4e9748b67542641325502d29a687b105c7eafd2d2094af67919')
sha256sums_aarch64=('5d7bae95fbef215556d470332e9b736a611b53f6f88eb502e3de23e816d29321')

package() {
	# Keep the upstream layout and private libraries together for relative RPATHs.
	install -dm755 "${pkgdir}/opt/nemo-speech" "${pkgdir}/usr/bin" \
		"${pkgdir}/usr/share/licenses" "${pkgdir}/usr/share/doc"
	cp -a "${srcdir}/nemo-speech-${_release}-linux-${CARCH}-vulkan/." \
		"${pkgdir}/opt/nemo-speech/"
	ln -s /opt/nemo-speech/bin/nemo-speech "${pkgdir}/usr/bin/nemo-speech"
	ln -s /opt/nemo-speech/share/licenses/nemo-speech \
		"${pkgdir}/usr/share/licenses/${pkgname}"
	ln -s /opt/nemo-speech/share/doc/nemo-speech \
		"${pkgdir}/usr/share/doc/${pkgname}"
}
