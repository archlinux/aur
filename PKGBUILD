# Maintainer: Max Gautier <mg@max.gautier.name>
pkgname=msmtpq-systemd
url="https://codeberg.org/VannTen/$pkgname"
pkgver=1.1.0
pkgrel=1
pkgdesc="Systemd unit for queuing and sending mail"
arch=(any)
license=('MIT')
groups=()
depends=(msmtp bash)
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/msmtpq-systemd-$pkgver.tar.gz"
    "$pkgname-$pkgver.sshsig::$url/releases/download/$pkgver/msmtpq-systemd-$pkgver.tar.gz.sshsig"
    "ALLOWED_SIGNERS"
    )
sha512sums=('SKIP' 'SKIP' 'SKIP')

verify() {
    ssh-keygen -Y verify -n tarball@max.gautier.name -I $(ssh-keygen -Y find-principals -s $pkgname-$pkgver.sshsig -f ALLOWED_SIGNERS) -f ALLOWED_SIGNERS -s $pkgname-$pkgver.sshsig < $pkgname-$pkgver.tar.gz
}

package() {

    make -C "$pkgname-$pkgver" DESTDIR=$pkgdir install
    install -Dm 644 "$pkgname-$pkgver"/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
