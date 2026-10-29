# Maintainer: hyperpuncher
pkgname=nemo-speech-cuda13-nightly-bin
pkgver=20261028.203448
pkgrel=1
_release=nightly
pkgdesc='Native speech recognition, synthesis, and translation with CUDA 13 support (nightly)'
arch=('aarch64')
url='https://github.com/NVIDIA/NeMo-Speech.cpp'
license=(
	'Apache-2.0'
	'BSD-3-Clause'
	'MIT'
	'MIT-0'
	'GPL-3.0-or-later WITH GCC-exception-3.1'
	'LicenseRef-NVIDIA-CUDA'
)
depends=('glibc')
# ARM driver packages depend on the board. Install its NVIDIA driver separately.
optdepends=(
	'curl: model downloads'
	'alsa-lib: microphone capture through ALSA'
	'libpulse: microphone capture through PulseAudio'
	'jack: microphone capture through JACK'
)
provides=("nemo-speech=${pkgver}")
conflicts=('nemo-speech')
options=('!strip' '!debug')
source_aarch64=("nemo-speech-${pkgver}-linux-aarch64-cuda13.tar.gz::${url}/releases/download/${_release}/nemo-speech-${_release}-linux-aarch64-cuda13.tar.gz")
sha256sums_aarch64=('552d323f5e46596164f866a85ba7b3c951492d3aed4493df3305539f617e71ab')

package() {
	# Keep the upstream layout and private libraries together for relative RPATHs.
	install -dm755 "${pkgdir}/opt/nemo-speech" "${pkgdir}/usr/bin" \
		"${pkgdir}/usr/share/licenses" "${pkgdir}/usr/share/doc"
	cp -a "${srcdir}/nemo-speech-${_release}-linux-${CARCH}-cuda13/." \
		"${pkgdir}/opt/nemo-speech/"
	ln -s /opt/nemo-speech/bin/nemo-speech "${pkgdir}/usr/bin/nemo-speech"
	ln -s /opt/nemo-speech/share/licenses/nemo-speech \
		"${pkgdir}/usr/share/licenses/${pkgname}"
	ln -s /opt/nemo-speech/share/doc/nemo-speech \
		"${pkgdir}/usr/share/doc/${pkgname}"
}
