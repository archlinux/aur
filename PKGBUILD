# Maintainer: Butter Cat <ButteredCats@protonmail.com>

_pkgname="xdg-unused-data"
pkgname="${_pkgname}-git"
pkgver=r123.f605067
pkgrel=1
pkgdesc="A simple way to identify unused applications data in user directories such as ~./config and ~/.cache."
arch=('any')
url="https://github.com/pawel-0/xdg-unused-data"
license=('MIT')
depends=('jq')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 -t "${pkgdir}/opt/xdg-unused-data" xdg-unused-data.sh application_schema.json
  install -Dm755 -t "${pkgdir}/opt/xdg-unused-data/applications" applications/*
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
  mkdir "${pkgdir}/usr/bin"
  ln -s "/opt/xdg-unused-data/xdg-unused-data.sh" "${pkgdir}/usr/bin/xdg-unused-data"
}
