# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Sorin Ionescu <sorin.ionescu@gmail.com>

pkgname=link-backup
pkgver=0.8
pkgrel=6
pkgdesc="Intelligent backup utility that handles renames, moves, duplicate files"
arch=('any')
url="http://www.scottlu.com/Content/Link-Backup.html"
license=('MIT')
depends=('python2' 'openssh' 'rsync')
makedepends=('patch')
install=$pkgname.install
source=(http://www.scottlu.com/files/lb.py
        lb.cron lb.exclude $pkgname.patch)
md5sums=('4acd3ea00da33ef14a87410cfcc7c987'
         '79b92199173c8895f828b9839c88ce62'
         '67548d6c7e00a8dab1c562e7735b93f9'
         '9e6b0ccb3a0ff0d4e4a554818e508ed1')

package() {
  cd "${srcdir}"

  install -Dm755 lb.py "${pkgdir}"/usr/bin/lb
  install -Dm755 lb.cron "${pkgdir}"/usr/share/lb/lb.cron
  install -Dm644 lb.exclude "${pkgdir}"/usr/share/lb/lb.exclude

#license
  install -d "${pkgdir}"/usr/share/licenses/${pkgname}/
  sed '1,16p;d' lb.py > "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

  cd "${pkgdir}"/usr/bin
  patch -Np0 -i "${srcdir}"/$pkgname.patch
}
