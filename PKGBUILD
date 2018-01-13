# Maintainer: mattski <redmattski at gmail dot com>

_pkgname=sonospy
pkgname=$_pkgname-git
pkgver=16
pkgrel=1
pkgdesc="A music server for Sonos"
arch=('any')
url="https://github.com/henkelis/sonospy/wiki/Welcome-to-Sonospy"
license=('GPL3')
depends=('python2')
makedepends=('git')
optdepends=('lame: for converting mp2 to mp3'
            'sox: for downsampling FLAC')
provides=($_pkgname)
conflicts=($_pkgname)
install=$pkgname.install
source=("$pkgname::git://github.com/henkelis/sonospy.git"
        'sonospy.service'
        'sonospy-scan.service'
        'sonospy.conf'
        'sonospy-scan.timer'
        'sonospy.sysusers'
        'sonospy.tmpfile')
backup=('etc/sonospy/sonospy.conf')
md5sums=('SKIP'
         'cb1aa86902f5a04b5bc86e30eb50fe9c'
         '407a5cc2b1d16f35aef94b0448a08083'
         'd2503c694ce7a653943e1406fc14dd2e'
         '88de0ae42d0579e32f8df3a3fdc16694'
         '6f7306d7872d3c2e0bb6dd7b52b73171'
         'ef3a9e190911c931311e8fd9f0c6e4ef')

pkgver() {
  cd $pkgname
  git log --pretty=format: | wc -l
}

package() {
  install -Dm644 sonospy.service "$pkgdir/usr/lib/systemd/system/sonospy.service"
  install -Dm644 sonospy-scan.service "$pkgdir/usr/lib/systemd/system/sonospy-scan.service"
  install -Dm644 sonospy-scan.timer "$pkgdir/usr/lib/systemd/system/sonospy-scan.timer"
  install -Dm644 sonospy.sysusers "$pkgdir/usr/lib/sysusers.d/sonospy.conf"
  install -Dm644 sonospy.tmpfile "$pkgdir/usr/lib/tmpfiles.d/sonospy.conf"

  install -dm755 "$pkgdir"/opt/sonospy/{app,data}
  cp -rp $pkgname/* "$pkgdir/opt/sonospy/app/"
  install -D -m644 sonospy.conf "${pkgdir}/etc/sonospy/sonospy.conf"
}
