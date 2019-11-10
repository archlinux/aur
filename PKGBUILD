# Maintainer: Adler Neves <adlerosn@gmail.com>

provides=('fail2web')
conflicts=('fail2web')
pkgver=r67.0a7d4bb
pkgname=fail2web-git
pkgrel=1
pkgdesc="fail2web is an fail2ban GUI powered by fail2rest"
arch=('any')
depends=('fail2rest')
makedepends=('nodejs' 'npm')
url="https://github.com/Sean-Der/fail2web"
options=()
license=('MIT')
source=('fail2web::git+https://github.com/Sean-Der/fail2web')
sha512sums=('SKIP')

pkgver() {
  cd fail2web
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgdir}"
  mkdir -p "${pkgdir}"/usr/share/webapps/fail2web/static
  
  cp "${srcdir}"/fail2web/web/. -r "${pkgdir}"/usr/share/webapps/fail2web/static/.
  cp "${srcdir}"/fail2web/http-configs/. -r "${pkgdir}"/usr/share/webapps/fail2web/.
  chmod 0644 -R "${pkgdir}"/usr/share/webapps/fail2web
  chmod 0644 -R "${pkgdir}"/usr/share/webapps/fail2web/static
  chmod 0755 "${pkgdir}"/usr/share/webapps/fail2web
  chmod 0755 "${pkgdir}"/usr/share/webapps/fail2web/static
  chmod 0755 "${pkgdir}"/usr/share/webapps/fail2web/static/fonts
}
