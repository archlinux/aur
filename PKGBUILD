# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname=sysbox-ce-bin
pkgver=0.7.2
pkgrel=2
epoch=2
pkgdesc="Container runtime with VM-like isolation (run Systemd, Docker, K8s in containers)"
url="https://github.com/nestybox/sysbox"
arch=('x86_64' 'aarch64')
license=('Apache-2.0')
source_x86_64=("https://github.com/nestybox/sysbox/releases/download/v${pkgver}/sysbox-ce_${pkgver}.linux_amd64.deb")
source_aarch64=("https://github.com/nestybox/sysbox/releases/download/v${pkgver}/sysbox-ce_${pkgver}.linux_arm64.deb")
sha256sums_x86_64=('50cde0e1124c2f028792ca66ab6b3949730ec38768dca1ef93d669802275ddd9')
sha256sums_aarch64=('b565c1ae4fbd4df4892e771edf121e4308db5b4699402b45768d00cda52ea2e9')
install=install.sh
depends=('rsync' 'fuse3')
provides=('sysbox-ce')
conflicts=('sysbox-ce')

prepare() {
	mkdir -p data
	tar xf data.tar.xz -C data
}

package() {
	cd "data"
	(cd lib/sysctl.d && find . -type f -exec install -Dm644 "{}" "${pkgdir}/usr/lib/sysctl.d/{}" \; )
	(cd lib/systemd && find . -type f -exec install -Dm644 "{}" "${pkgdir}/usr/lib/systemd/{}" \; )
	(cd usr/bin && find . -type f -exec install -Dm755 "{}" "${pkgdir}/usr/bin/{}" \; )
	(cd usr/share/doc && find . -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/doc/{}" \; )
}
