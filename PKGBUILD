# Maintainer: Matt Cuneo <m@cuneo.au>

pkgname=sabnzbd-exporter
pkgver=0.1.78
pkgrel=1
_repoorg=msroest
_reponame=sabnzbd_exporter
pkgdesc="A metrics exporter for sending statistics from sabnzbd to prometheus"
arch=('x86_64')
url="https://github.com/$_repoorg/$_reponame"
license=('GPL3')
depends=('python' 'python-prometheus_client' 'python-requests')
source=("${url}/archive/refs/tags/$pkgver.tar.gz" 'sabnzbd-exporter.service' 'sabnzbd-exporter.sysusers' 'sabnzbd-exporter.env')
sha256sums=('696b6ccf1ccd1b0bb2832cf5a11efc41386a46ea630ba7e96b37d80b52fdbc68'
            'ce69154933d96c45aae7bf73b8bb48aea87ce48180b745e4d7666a24b489176a'
            '358bc78d593af8e73a4818d78e44d5da9992688caa03303f7bb2e064df70af24'
            '01e4d57c0940081269bef492d7ee8ba0b6766c23d87e5ae502a941fcb4524693')
backup=(etc/sabnzbd-exporter.env)
package() {
	install -Dm755 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	install -Dm644 "$srcdir/$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
	install -Dm755 "$srcdir/$_reponame-$pkgver/sabnzbd_exporter.py" "$pkgdir/usr/lib/sabnzbd-exporter/sabnzbd_exporter.py"
	install -Dm755 "$srcdir/sabnzbd-exporter.env" "$pkgdir/etc/sabnzbd-exporter.env"
}
