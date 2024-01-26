# Maintainer: Achmad Fathoni <fathoni DOT id AT gmail DOT com>

pkgname=evaltool-bin
pkgver=1.11.0
pkgrel=1
pkgdesc="Explore and test functionality of the Inertial Sense products in real-time"
arch=('x86_64')
url="https://docs.inertialsense.com/user-manual/software/evaltool/"
license=('MIT')
_file="EvalTool_${pkgver}_linux_installer"

source=("https://github.com/inertialsense/inertial-sense-sdk/releases/download/${pkgver}/$_file.zip"
        "90-inertialsense.rules")
sha256sums=('e4dde51aa825e29c6f297fedddd141d1d741bfccfa8e33412cccfdbbe9ced236'
            '8352c76db701b3ee1e98424eb7f373b596b7637ae7c8c042eb497b5916a00416')

package(){
    # Install udev rule
    install -Dm644 90-inertialsense.rules ${pkgdir}/etc/udev/rules.d/90-inertialsense.rules

	# Extract package data
    cd ${srcdir}/$_file
	ar xv EvalTool_${pkgver}.deb
	tar xf data.tar.zst -C "${pkgdir}"
    find "${pkgdir}" -type d -exec chmod 755 {} \;
}
