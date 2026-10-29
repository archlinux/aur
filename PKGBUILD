# Maintainer: hyperpuncher
pkgname=nemo-speech-cpu-nightly-bin
pkgver=20261028.203448
pkgrel=1
_release=nightly
pkgdesc='Native speech recognition, synthesis, and translation with CPU support (nightly)'
arch=('x86_64' 'aarch64')
url='https://github.com/NVIDIA/NeMo-Speech.cpp'
license=(
	'Apache-2.0'
	'BSD-3-Clause'
	'MIT'
	'MIT-0'
	'GPL-3.0-or-later WITH GCC-exception-3.1'
)
depends=('glibc')
optdepends=(
	'curl: model downloads'
	'alsa-lib: microphone capture through ALSA'
	'libpulse: microphone capture through PulseAudio'
	'jack: microphone capture through JACK'
)
provides=("nemo-speech=${pkgver}")
conflicts=('nemo-speech')
options=('!strip' '!debug')
source_x86_64=("nemo-speech-${pkgver}-linux-x86_64-cpu.tar.gz::${url}/releases/download/${_release}/nemo-speech-${_release}-linux-x86_64-cpu.tar.gz")
source_aarch64=("nemo-speech-${pkgver}-linux-aarch64-cpu.tar.gz::${url}/releases/download/${_release}/nemo-speech-${_release}-linux-aarch64-cpu.tar.gz")
sha256sums_x86_64=('12b9c8f0f0280731c0a5d47eef1f1380499b688038c872661ff9cd935d27a974')
sha256sums_aarch64=('a2b196af8b5f56e9d01ec362f8ff8ce8f6effb82726f6f280d37428de8491d1c')

package() {
	# Keep the upstream layout and private libraries together for relative RPATHs.
	install -dm755 "${pkgdir}/opt/nemo-speech" "${pkgdir}/usr/bin" \
		"${pkgdir}/usr/share/licenses" "${pkgdir}/usr/share/doc"
	cp -a "${srcdir}/nemo-speech-${_release}-linux-${CARCH}-cpu/." \
		"${pkgdir}/opt/nemo-speech/"
	ln -s /opt/nemo-speech/bin/nemo-speech "${pkgdir}/usr/bin/nemo-speech"
	ln -s /opt/nemo-speech/share/licenses/nemo-speech \
		"${pkgdir}/usr/share/licenses/${pkgname}"
	ln -s /opt/nemo-speech/share/doc/nemo-speech \
		"${pkgdir}/usr/share/doc/${pkgname}"
}
