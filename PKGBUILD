# Maintainer: hyperpuncher
pkgname=nemo-speech-vulkan-bin
pkgver=0.2.0
pkgrel=2
pkgdesc='Native speech recognition, synthesis, and translation with Vulkan support'
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
source_x86_64=("${url}/releases/download/v${pkgver}/nemo-speech-${pkgver}-linux-x86_64-vulkan.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/nemo-speech-${pkgver}-linux-aarch64-vulkan.tar.gz")
sha256sums_x86_64=('c8d0ed5b9ac5fb6d5c460015ba38ea217415c44edc1e6d49120646781009aee6')
sha256sums_aarch64=('370f69391db9a8f1d112e1baaa7f1f738776bd88fd4f4e2d61f5d6489d061126')

package() {
	# Keep the upstream layout and private libraries together for relative RPATHs.
	install -dm755 "${pkgdir}/opt/nemo-speech" "${pkgdir}/usr/bin" \
		"${pkgdir}/usr/share/licenses" "${pkgdir}/usr/share/doc"
	cp -a "${srcdir}/nemo-speech-${pkgver}-linux-${CARCH}-vulkan/." \
		"${pkgdir}/opt/nemo-speech/"
	ln -s /opt/nemo-speech/bin/nemo-speech "${pkgdir}/usr/bin/nemo-speech"
	ln -s /opt/nemo-speech/share/licenses/nemo-speech \
		"${pkgdir}/usr/share/licenses/${pkgname}"
	ln -s /opt/nemo-speech/share/doc/nemo-speech \
		"${pkgdir}/usr/share/doc/${pkgname}"
}
