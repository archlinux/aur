# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Michal Wojdyla (https://aur.archlinux.org/account/micwoj92)
# Contributor: Darren Wu <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>
pkgname=raleigh-reloaded-git
pkgver=1.5+6.r161.20230323.ca39c61
pkgrel=1
pkgdesc="A GTK theme aiming to revive the classic Raleigh theme"
arch=('any')
url="https://github.com/vlastavesely/raleigh-reloaded"
license=('GPL2')
depends=('gtk3')
provides=("${pkgname%-git}=${pkgver}")
conflicts=("${pkgname%-git}")
options=('!strip')
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  _ver="$(git describe --long | sed -E -e 's|^[vV]||' -e 's|-g[0-9a-f]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make PREFIX="$pkgdir"/usr install
}
