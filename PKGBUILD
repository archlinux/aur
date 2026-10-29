# Maintainer: hyperpuncher
pkgname=nemo-speech-vulkan-nightly-bin
pkgver=20261028.203448
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
sha256sums_x86_64=('0a733bd1fdae0ebf8280ef1a992a597d25bf72b54e4503342f3ec22efe9f8eaa')
sha256sums_aarch64=('540e00893d100df93cba5ae320dc247bd621ee33557b11ae004bce935a0bf869')

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
