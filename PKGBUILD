# Maintainer: justbispo <aur.fyxy0@slmail.me>

pkgname=refind-theme-refind2k-git
_pkgname=refind2k
pkgver=r49.da28a55
pkgrel=1
pkgdesc="A minimalist dark theme for rEFInd"
arch=('any')
url="https://github.com/2KAbhishek/refind2k"
license=('MIT')
depends=('refind')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
install=$pkgname.install

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd $pkgname
  local _theme_dir="usr/share/refind/themes/${_pkgname}"

  install -D -m0644 -t "${pkgdir}/${_theme_dir}/" "refind2k.conf"
  install -D -m0755 -t "${pkgdir}/${_theme_dir}/" "setup.sh"
  install -D -m0644 -t "${pkgdir}/${_theme_dir}/icons" "icons/"*.png
  install -D -m0644 -t "${pkgdir}/${_theme_dir}/banners" "banners/"*.png
  install -D -m0644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE"
  install -D -m0644 -t "${pkgdir}/usr/share/doc/${pkgname}" "README.md"
}
