# Maintainer: Sam Zuk <sam11120a@gmail.com>
pkgname=vmpc2000xl-standalone-bin
pkgver=0.9.3
pkgrel=1
pkgdesc='MPC2000XL sampler emulator (standalone)'
arch=('x86_64')
url='https://www.izmar.nl/'
license=('GPL-3.0-or-later')
depends=(
	'libx11'
	'jack'
	'alsa-lib>=1.0.16'
	'glibc>=2.35'
	'libgcc>=3.4'
	'glib2>=2.30.0'
	'libstdc++>=12'
	'udisks2>=2.0.0'
	'libxcb'  # unknown version requirement
	'zlib'  # unknown version requirement
	'util-linux-libs'  # unknown version requirement
	'libffi'  # unknown version requirement
	'pcre2'  # unknown version requirement
	'libpipewire'  # unknown version requirement
	'libxau'  # unknown version requirement
	'libxdmcp'  # unknown version requirement
)
source=(
	"https://github.com/izzyreal/vmpc-juce/releases/download/v${pkgver}/VMPC2000XL-Ubuntu20-x86_64-Standalone.zip"
	"https://github.com/izzyreal/vmpc-juce/raw/refs/tags/v${pkgver}/README.md"
	"https://github.com/izzyreal/vmpc-juce/raw/refs/tags/v${pkgver}/LICENSE.txt"
	"https://vmpcdocs.izmar.nl/_static/vmpc-logo.png"
)
sha256sums=(
	'9a4184361ed679dd89f9b35ba015fbd9fca127d4f9766eeaf27356740a747857'
	'8195bf5f0fa05983867b74afa8e0585fc6cff16f1ea0c840d42e700eef5e057a'
	'3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
	'28bf1de1984104bcc08ad34a52b27bde4e5989c17cf5d6b67d67160b838e5173'
)

prepare() {
	cat > VMPC2000XL.desktop <<-EOF
	[Desktop Entry]
	Type=Application
	Version=${pkgver}
	Name=VMPC2000XL
	Commment=MPC2000XL sampler emulator (standalone)
	Path=/usr/bin
	Exec=VMPC2000XL
	Icon=vmpc2000xl
	Terminal=false
	Categories=AudioVideo;Audio;
	EOF
}

package() {
	install -Dm755 './VMPC2000XL' "${pkgdir}/usr/bin/VMPC2000XL"
	mkdir -pm755 "${pkgdir}/usr/share/doc/vmpc2000xl-standalone"
	install -m644 './README.md' "${pkgdir}/usr/share/doc/vmpc2000xl-standalone"
	mkdir -pm755 "${pkgdir}/usr/share/licenses/vmpc2000xl-standalone"
	install -m644 './LICENSE.txt' "${pkgdir}/usr/share/licenses/vmpc2000xl-standalone/LICENSE"
	install -Dm644 './VMPC2000XL.desktop' "${pkgdir}/usr/share/applications/VMPC2000XL.desktop"
	install -Dm644 './vmpc-logo.png' "${pkgdir}/usr/share/pixmaps/vmpc2000xl.png"
}
