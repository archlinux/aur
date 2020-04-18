# Maintainer: robertfoster
pkgname=google-music-manager-uploader
pkgver=1.6.3
pkgrel=1
pkgdesc="Google Music Manager Uploader Daemon"
arch=('any')
url="https://github.com/jaymoulin/google-music-manager-uploader"
license=('MIT')
depends=('google-music-manager-auth' 'python-beautifulsoup4' 'python-gmusicapi' 'python-netifaces' 'python-watchdog')
makedepends=('python-setuptools')
source=("https://github.com/jaymoulin/google-music-manager-uploader/archive/$pkgver.tar.gz"
	$pkgname.conf
	$pkgname.service
	$pkgname.sysuser.conf)

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -i 's/bs4/beautifulsoup4/g' setup.cfg
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 $srcdir/$pkgname.service $pkgdir/usr/lib/systemd/system/$pkgname.service
    install -Dm644 $srcdir/$pkgname.conf $pkgdir/etc/conf.d/$pkgname
    install -Dm755 $srcdir/$pkgname.sysuser.conf $pkgdir/usr/lib/sysusers.d/$pkgname.conf
}
md5sums=('5ad3ec79526dbf844833ec2da027bc94'
         'ba5e0e2aa8094880a7788ec7a45bde86'
         '701a80da141fcb99429daf9bdfbf59e3'
         '8cf4bd4d72a08faffbf23b2a0fcf82ac')
