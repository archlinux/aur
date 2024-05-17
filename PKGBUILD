# Maintainer: Matthew Weger <matthew.d.weger@gmail.com>
pkgname=auto_facelock
pkgver=1.0.0
pkgrel=1
pkgdesc="Face Detection Auto Screen Lock Service"
arch=('any')
license=('MIT')
depends=('python' 'python-opencv' 'python-numpy' 'python-face_recognition')
makedepends=('git')
source=("${pkgname}-${pkgver}.tar.gz")
sha256sums=('SKIP')
install="setup.install"

package() {
    install -Dm755 "$srcdir/${pkgname}-${pkgver}/auto_facelock.py" "$pkgdir/usr/local/bin/auto_facelock.py"
    install -Dm755 "$srcdir/${pkgname}-${pkgver}/auto_facelock_enroll.py" "$pkgdir/usr/local/bin/auto_facelock_enroll.py"
    install -Dm644 "$srcdir/${pkgname}-${pkgver}/auto_facelock@.service" "$pkgdir/etc/systemd/system/auto_facelock@.service"
    install -d "$pkgdir/usr/local/share/known_faces"
}


post_install() {
    echo "Starting post_install script..." | tee -a /tmp/post_install.log
    echo "***********************************************************" | tee -a /tmp/post_install.log
    echo "* Thank you for installing auto_facelock.                 *" | tee -a /tmp/post_install.log
    echo "*                                                         *" | tee -a /tmp/post_install.log
    echo "* To enable and start the service, run:                   *" | tee -a /tmp/post_install.log
    echo "*   sudo systemctl enable auto_facelock@<username>.service*" | tee -a /tmp/post_install.log
    echo "*   sudo systemctl start auto_facelock@<username>.service *" | tee -a /tmp/post_install.log
    echo "*                                                         *" | tee -a /tmp/post_install.log
    echo "* Replace <username> with your actual username.           *" | tee -a /tmp/post_install.log
    echo "*                                                         *" | tee -a /tmp/post_install.log
    echo "***********************************************************" | tee -a /tmp/post_install.log
}

# Optional: Create a post_upgrade function if needed
post_upgrade() {
    post_install
}
