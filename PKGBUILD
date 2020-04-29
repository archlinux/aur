# Maintainer: Bart De Vries <bart at mogwai dot be>

pkgname=roundcubemail-plugin-identity-smtp-git
pkgver=r64.b14e295
pkgrel=1
pkgdesc='Roundcube plugin to setup different SMTP settings per identity '
arch=('any')
url='https://github.com/deflomu/Roundcube-SMTP-per-Identity-Plugin'
license=('MIT')
makedepends=("git")
depends=('roundcubemail')
source=("${pkgname}::git+https://github.com/deflomu/Roundcube-SMTP-per-Identity-Plugin.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  _instdir="${pkgdir}"/usr/share/webapps/roundcubemail/plugins/identity_smtp
  install -dm755 "${_instdir}"/localization
  cd "${srcdir}/${pkgname}"
  install -m644 localization/* "${_instdir}"/localization
  install -m644 composer.json "${_instdir}"
  install -m644 crowdin.yaml "${_instdir}"
  install -m644 identity_smtp.js "${_instdir}"
  install -m644 identity_smtp.php "${_instdir}"
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

