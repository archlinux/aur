# Maintainer: Achmad Fathoni <fathoni DOT id AT gmail DOT com>

pkgname=evaltool-bin
pkgver=1.9.1
pkgrel=1
pkgdesc="Explore and test functionality of the Inertial Sense products in real-time"
arch=('x86_64')
url="https://docs.inertialsense.com/user-manual/software/evaltool/"
license=('MIT')
depends=('qt5-charts-ubuntu-ver')

source=("https://github.com/inertialsense/inertial-sense-sdk/releases/download/${pkgver}/EvalTool_${pkgver}_installer.tar"
        "90-inertialsense.rules")
sha256sums=('294d55a39819a47cb03d5f6c5800d5d90290b4e09dc56bafeb6b4990b6b5fd1f'
            '8352c76db701b3ee1e98424eb7f373b596b7637ae7c8c042eb497b5916a00416')

package(){
    # Install udev rule
    install -Dm644 90-inertialsense.rules ${pkgdir}/etc/udev/rules.d/90-inertialsense.rules

	# Extract package data
    cd ${srcdir}/EvalTool_${pkgver}_installer
	ar xv EvalTool_${pkgver}.deb
	tar xf data.tar.xz -C "${pkgdir}"
    find "${pkgdir}" -type d -exec chmod 755 {} \;
}
