# Maintainer: Francesco Cherchi <frnchr.d9var@slmail.me>
# Contributor: Francesco Cherchi <frnchr.d9var@slmail.me>
# Contributor: XZS <d dot f dot fischer at web dot de>

pkgname=gnome-shell-extension-scroll-workspaces-git
_srcname=gnome-shell-scroll-workspaces
pkgver=r73.3b97321
pkgrel=1
pkgdesc="Change workspaces by scrolling while over the top panel in Gnome Shell"
url="https://github.com/timbertson/${_srcname}"
arch=('any')
license=("unknown")
depends=( "gnome-shell" )
makedepends=("git" "python" "jq")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${_srcname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_srcname}"
  python tools/gup
}

package() {
  cd "${_srcname}"
  mkdir --parents "${pkgdir}/usr/share/gnome-shell/extensions"
  mv "${_srcname#gnome-shell-}" "${pkgdir}/usr/share/gnome-shell/extensions/$(jq -r .uuid "${_srcname#gnome-shell-}/metadata.json")"
}

