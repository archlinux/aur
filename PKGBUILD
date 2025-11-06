# Maintainer: Todd E Johnson <todd@toddejohnson.net>

pkgname=automatic-ripping-machine
pkgver=2.20.7
pkgrel=1
pkgdesc="Automatic Ripping Machine (ARM) Scripts."
arch=('any') 
url="https://github.com/automatic-ripping-machine/automatic-ripping-machine"
license=('MIT')
depends=('python'
         'python-yaml'
         'python-netifaces'
         'python-bcrypt'
         'python-flask'
         'python-flask-migrate'
         'python-flask-cors'
         'python-flask-sqlalchemy>=3.1.1'
         'python-sqlalchemy>=2.0.31'
         'python-flask-wtf'
         'python-flask-login'
         'python-pyudev'
         'python-prettytable'
         'python-musicbrainzngs'
         'python-discid'
         'python-pydvdid'
         'python-xmltodict'
         'python-waitress'
         'apprise'
         'systemd'
         'handbrake-cli'
         'ffmpeg'
         'abcde'
         'glyr'
         'flac'
         'cdparanoia'
         'perl-webservice-musicbrainz'
         'perl-musicbrainz-discid'
         'perl-io-socket-ssl'
         'perl-lwp-protocol-https'
         'lsdvd'
         'at'
         'makemkv')
makedepends=('python-build')
source=("https://github.com/automatic-ripping-machine/automatic-ripping-machine/archive/${pkgver}.tar.gz"
        "automatic-ripping-machine.sysusers"
        "automatic-ripping-machine.tmpfiles")
sha256sums=('5e84dd10bc83cb0bd409e12be72e7b499363d75c0fe3aa0f104acc0b1bd37a36'
            '03f0bd4ebd30343780624371fbce478df0a3ecc5504545108ee6147a107bd513'
            '393a764229cd84985f8a37f22e7e0ff8e8544a2d1da0b08805a92c8b674acf9a')
backup=('etc/arm/config/arm.yaml'
        'etc/arm/config/abcde.conf'
        'etc/arm/config/apprise.yaml')

build() {
  cd $pkgname-$pkgver
  
}

package() {
  cd $pkgname-$pkgver
  install -d "$pkgdir/opt/arm"
  cp -dpr --no-preserve=ownership ./ "$pkgdir/opt/arm"
  install -d "$pkgdir/etc/arm"
  install -d "$pkgdir/etc/arm/config"
  install -D -m644 "setup/arm.yaml" "$pkgdir/etc/arm/config/arm.yaml"
  install -D -m644 "setup/.abcde.conf" "$pkgdir/etc/arm/config/abcde.conf"
  install -D -m644 "setup/apprise.yaml" "$pkgdir/etc/arm/config/apprise.yaml"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 "setup/armui.service" "$pkgdir/usr/lib/systemd/system/armui.service"
  install -D -m644 "setup/51-automedia.rules" "$pkgdir/usr/lib/udev/rules.d/51-automedia.rules"
  install -D -m644 "../$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -D -m644 "../$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
