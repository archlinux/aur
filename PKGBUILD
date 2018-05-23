# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=combust-git
pkgver=0.71.674219b
pkgrel=1
pkgdesc='nftables firewall script with profiles'
arch=('any')
url='https://github.com/gavinhungry/combust'
license=('MIT')
depends=('nftables')
backup=('etc/combust.conf')
source=("${pkgname}::git+https://github.com/gavinhungry/combust.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  echo 0.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "${srcdir}/${pkgname}"

  install -Dm644 combust.conf "${pkgdir}"/etc/combust.conf
  install -Dm755 combust.sh "${pkgdir}"/usr/bin/combust
  install -Dm644 combust.service "${pkgdir}"/usr/lib/systemd/system/combust.service
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
