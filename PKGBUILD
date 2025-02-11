# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=combust-git
pkgver=0.72.b1922b8
pkgrel=1
pkgdesc="nftables firewall script with profiles"
arch=('any')
url="https://github.com/gavinhungry/combust"
license=('MIT')
depends=('nftables' 'iproute2')
backup=('etc/combust.conf')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}"/${pkgname}
  echo 0.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "${srcdir}"/${pkgname}

  install -Dm644 combust.conf "${pkgdir}"/etc/combust.conf
  install -Dm755 combust.sh "${pkgdir}"/usr/bin/combust
  install -Dm644 combust.service "${pkgdir}"/usr/lib/systemd/system/combust.service
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
