# Maintainer: Levi Sabah <x@levisabah.com>

pkgname=hostsctl-git
pkgver=r94.6b12adb
pkgrel=1
pkgdesc="Control your /etc/hosts file easily, block ads, social networks, and more."
arch=('any')
url="https://github.com/levisabah/${pkgname%-git}"
license=('GPLv3')
depends=('git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git://github.com/levisabah/${pkgname%-git}.git")
md5sums=('SKIP')
install=hostsctl.install

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  install -Dm755 bin/hostsctl.sh "${pkgdir}/usr/bin/hostsctl"
  install -Dm644 etc/hostsctl.conf "${pkgdir}/usr/share/doc/${pkgname}/hostsctl.conf"
  install -Dm644 hostsctl.bash-completion "${pkgdir}/usr/share/bash-completion/completions/hostsctl"
  mkdir -p "${pkgdir}/etc/hostsctl.d/"
  install -Dm644 LICENSE "${pkgdir%-git}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
