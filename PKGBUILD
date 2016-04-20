# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=combust-git
_gitname=combust
pkgver=0.55.8cff6c8
pkgrel=1
pkgdesc='iptables/nftables firewall script with profiles'
arch=('any')
license=('MIT')
url='https://github.com/gavinhungry/combust'
depends=('iptables' 'nftables')
source=("${_gitname}::git+https://github.com/gavinhungry/${_gitname}.git#branch=master")
md5sums=('SKIP')
backup=('etc/combust/combust.conf')

pkgver () {
  cd "${srcdir}/${_gitname}"
  echo "0.$(git rev-list --count HEAD).$(git describe --always | sed 's|-|.|g')"
}

package() {
  cd "${srcdir}/${_gitname}"

  install -d $pkgdir/etc/combust/
  install -d $pkgdir/usr/lib/systemd/system/
  install -m755 combust.sh "${pkgdir}"/etc/combust/
  install -m755 combust-nft.sh "${pkgdir}"/etc/combust/
  install -m600 combust.conf "${pkgdir}"/etc/combust/
  install -m644 combust.service "${pkgdir}"/usr/lib/systemd/system/
  install -m644 combust-nft.service "${pkgdir}"/usr/lib/systemd/system/
}
