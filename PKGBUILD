# Maintainer: robertfoster
pkgname=google-music-manager-uploader
pkgver=1.6.3
pkgrel=1
pkgdesc="Google Music Manager Uploader Daemon" # renovate: datasource=github-tags depName=jaymoulin/google-music-manager-uploader
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
sha256sums=('2cc03a351730d1831fd67a23193e2b792cece348deae6458cb6b2d8ce7b82dfd'
            '4e5e723556f8f01b7d38e59c50c17fbc0be9318e816bb96514c12294763f7b54'
            'c6b4f2bba31972434c206fdb4f9e4b1e0b8bba8febade3d40226107b130db47f'
            '4a7842fc761289026ae89928474a34e07cdf7e7e881b37d80977d4bea50f0d66')
