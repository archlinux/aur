# Maintainer: Kyle Sferrazza <kyle.sferrazza@gmail.com>

pkgname=pick-colour-picker
pkgver=1.5
pkgrel=5
pkgdesc="Pick. A colour picker that remembers where you picked colours from"
arch=('any')
url="http://kryogenix.org/code/pick/"
license=('custom')
depends=('python2-setuptools' 'python2-gobject' 'python2-cairo')
source=("${pkgname}_${pkgver}-0-201702011054-ubuntu17.10.1_all.deb::https://code.launchpad.net/~sil/+archive/ubuntu/pick/+files/${pkgname}_${pkgver}-0~201702011054~ubuntu17.10.1_all.deb")
md5sums=('6debb5d29903792366725131b6d082c7')

prepare() {
  bsdtar -xJf data.tar.xz
}

package() {
  cp --preserve=mode -r usr "${pkgdir}"
  find "${pkgdir}" -type f -name 'pick-colour-picker' -exec sed -i "s/python/python2/g" {} \;
  find "${pkgdir}" -depth -type d -name "dist-packages" -execdir mv {} "site-packages" \;
  find "${pkgdir}" -type d -exec chmod 755 {} \;
  install -dm755 "${pkgdir}"/usr/share/licenses/$pkgname
  mv "${pkgdir}"/usr/share/licenses/$pkgname .
}
