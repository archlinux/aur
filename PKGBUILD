# Maintainer: ArcanusNEO <admin@transcliff.top>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: librewish
pkgname=whitesur-kvantum-theme-patched-git
_gitname=WhiteSur-kde
pkgver=r106.b502d15
pkgrel=1
pkgdesc="WhiteSur theme for Kvantum, with patches customized for better GNOME experience."
arch=('any')
url="https://github.com/vinceliuice/${_gitname}"
license=('GPL3')
depends=('kvantum-qt5')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=(
  "${pkgname%-git}"
  'whitesur-kvantum-theme'
  'whitesur-kvantum-theme-git'
  'whitesur-kde-theme'
  'whitesur-kde-theme-git')
source=("git+${url}.git" 'Kvantum.patch')
sha256sums=(
  'SKIP'
  '103b5dfff5aecb651573357a9f36e645c94979ea42e53bc7226400e5e447f3c2'
)

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  patch -p1 -d"${srcdir}/${_gitname}/Kvantum" <"${srcdir}/Kvantum.patch"
  install -d "${pkgdir}/usr/share"
  mv "${srcdir}/${_gitname}/Kvantum" "${pkgdir}/usr/share"
}
