# Contributor: Florian Heyer <florian.heyer@gmx.de>

pkgname=backup2l
pkgver=1.6
pkgrel=1
pkgdesc="Low-maintenance backup/restore tool"
arch=('any')
url="https://gkiefer.github.io/backup2l/"
license=('GPL')
backup=('etc/backup2l.conf')
depends=('awk' 'bash' 'findutils' 'grep' 'gzip' 'sed')
optdepends=('bzip2: external compressor'
            'cron: for the daily backup')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/gkiefer/$pkgname/archive/refs/tags/v$pkgver.tar.gz
        install-sh.patch)
b2sums=('940a931899cf31acd3da80cf6b2d3846882b01b37fbecedc72d7fdf7ca6d4485648f1e14c630808b04725da02a3ea25570271c8a891be18035053e34cc2e9a41'
        '1842511e5f03c22e341cfe18e564704a439f3c82dcb97b8edd059eec39db7c45bb02a9c578eeb931077821bc6dd326d57a7410b99225c40bb11f5f6187f93b71')


prepare() {
  cd $pkgname-$pkgver
  patch -Np0 -i "$srcdir"/install-sh.patch
}

package() {
  cd $pkgname-$pkgver
  install -d ${pkgdir}/etc/cron.daily
  ./install-sh -fc ${pkgdir}/usr ${pkgdir}/usr/bin ${pkgdir}/etc
}

