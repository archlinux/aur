# Maintainer: hyperpuncher
pkgname=nemo-speech-cpu-bin
pkgver=0.3.0
pkgrel=1
pkgdesc='Native speech recognition, synthesis, and translation with CPU support'
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
source_x86_64=("${url}/releases/download/v${pkgver}/nemo-speech-${pkgver}-linux-x86_64-cpu.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/nemo-speech-${pkgver}-linux-aarch64-cpu.tar.gz")
sha256sums_x86_64=('255f12b722ab15b2a38a51cf125d56e3fa97058b528f7e895b39d6a473deb06e')
sha256sums_aarch64=('56858eaf50d19b05902c043f65d0057352bdc107ae380c41053bfbddfc204bf1')

package() {
	# Keep the upstream layout and private libraries together for relative RPATHs.
	install -dm755 "${pkgdir}/opt/nemo-speech" "${pkgdir}/usr/bin" \
		"${pkgdir}/usr/share/licenses" "${pkgdir}/usr/share/doc"
	cp -a "${srcdir}/nemo-speech-${pkgver}-linux-${CARCH}-cpu/." \
		"${pkgdir}/opt/nemo-speech/"
	ln -s /opt/nemo-speech/bin/nemo-speech "${pkgdir}/usr/bin/nemo-speech"
	ln -s /opt/nemo-speech/share/licenses/nemo-speech \
		"${pkgdir}/usr/share/licenses/${pkgname}"
	ln -s /opt/nemo-speech/share/doc/nemo-speech \
		"${pkgdir}/usr/share/doc/${pkgname}"
}
