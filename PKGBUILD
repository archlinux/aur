# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=combust-git
_gitname=combust
pkgver=0.66.6779dd2
pkgrel=2
pkgdesc='nftables firewall script with profiles'
arch=('any')
license=('MIT')
url='https://github.com/gavinhungry/combust'
depends=('nftables')
source=("${_gitname}::git+https://github.com/gavinhungry/${_gitname}.git#branch=master")
sha256sums=('SKIP')
backup=('etc/combust.conf')

pkgver () {
  cd "${srcdir}/${_gitname}"
  echo "0.$(git rev-list --count HEAD).$(git describe --always | sed 's|-|.|g')"
}

package() {
  cd "${srcdir}/${_gitname}"

  install -d $pkgdir/etc/
  install -d $pkgdir/usr/bin/
  install -d $pkgdir/usr/lib/systemd/system/
  install -m600 combust.conf "${pkgdir}"/etc/
  install -m755 combust.sh "${pkgdir}"/usr/bin/combust
  install -m644 combust.service "${pkgdir}"/usr/lib/systemd/system/
}
