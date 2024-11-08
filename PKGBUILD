# Maintainer: Vasiliy Nikitin <nvasya95@gmail.com>
#
# # 
#  See INSTALL.md to setup firefox to use this theme when installed
#  in your system /usr/lib directory via pacman and this PKGBUILD.
# #

_pkgbase=firefox-gnome-theme
pkgname=${_pkgbase}-nightly-git
pkgver=r1134.fe2b635
pkgrel=1
pkgdesc='A GNOME theme for Firefox Nightly'
arch=('any')
url='https://github.com/rafaelmardojai/firefox-gnome-theme'
license=('Unlicense')
optdepends=('firefox-developer-edition: compatible browser'
	'firefox-nightly: compatible browser')
makedepends=('git')
install="${_pkgbase}.install"
source=("${_pkgbase}::git+${url}.git#branch=nightly"
        "INSTALL.md")
sha256sums=('SKIP'
            'f0fc2ccb43b813174e329fef74ab37a8cbfecd60168dbe05ccba999cfd8d222a')
conflicts=('firefox-gnome-theme' 'firefox-gnome-theme-git')

pkgver() {
  cd "${_pkgbase}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "${_pkgbase}"
  install -d "${pkgdir}/usr/lib/${_pkgbase}"
  cp -rfa * "${pkgdir}/usr/lib/${_pkgbase}"
  # Remove uneeded files
  rm -rf "${pkgdir}/usr/lib/${_pkgbase}"/{scripts,LICENSE,README.md,screenshot.png}
  # Install docs & license
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgbase}/README.md"
  install -Dm644 ${srcdir}/INSTALL.md "${pkgdir}/usr/share/doc/${_pkgbase}/INSTALL.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgbase}/LICENSE"
}
