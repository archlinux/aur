# Maintainer: hyperpuncher
pkgname=nemo-speech-vulkan-bin
pkgver=0.3.0
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
sha256sums_x86_64=('2a8b2ca4610b6ea5d659ba10794526f6e5a77fb1623d52c35272a9fd1f74abac')
sha256sums_aarch64=('0de233655dd579117f8f0cfd6c9dc77fe53bf11673cc44b5c42017a1fb2b8140')

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
