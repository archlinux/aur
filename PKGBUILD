# Maintainer: ArcanusNEO <admin@transcliff.top>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: librewish
pkgname=whitesur-kvantum-theme-patched-git
_gitname=WhiteSur-kde
pkgver=r109.cb960cd
pkgrel=1
pkgdesc="WhiteSur theme for Kvantum, with patches customized for better GNOME experience."
arch=('any')
url="https://github.com/vinceliuice/${_gitname}"
license=('GPL3')
depends=('kvantum-qt5')
provides=("${pkgname%-git}")
conflicts=(
  "${pkgname%-git}"
  'whitesur-kvantum-theme'
  'whitesur-kvantum-theme-git'
  'whitesur-kde-theme'
  'whitesur-kde-theme-git')
source=("git+${url}.git" 'gnomish.patch')
sha256sums=(
  'SKIP'
  '61682ce8cfa6feb2af18c1aeecde46752412ebf3af10e666a48b414d0a10b7a8'
)

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  patch -p1 -d"${srcdir}/${_gitname}/Kvantum" <"${srcdir}/gnomish.patch"
  install -d "${pkgdir}/usr/share"
  mv "${srcdir}/${_gitname}/Kvantum" "${pkgdir}/usr/share"
}
