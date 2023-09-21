# Maintainer: Ewout van Mansom <ewout@vanmansom.name>
# Contributor: skrewball <aur at joickle dot com> gitlab.com/skrewball/aur
#
# # 
#  See INSTALL.md to setup firefox to use this theme when installed
#  in your system /usr/lib directory via pacman and this PKGBUILD.
# #

_pkgbase=firefox-gnome-theme
pkgname=firefox-gnome-theme-45
pkgver=82.r452.ga78c6e6
pkgrel=1
pkgdesc='A GNOME theme for Firefox'
arch=('any')
url='https://github.com/rafaelmardojai/firefox-gnome-theme'
license=('Unlicense')
optdepends=('firefox: primary compatible browser'
            'librewolf: alternative compatible browser')
makedepends=('git')
provides=('firefox-gnome-theme')
conflicts=('firefox-gnome-theme' 'firefox-gnome-theme-git')
install="${_pkgbase}.install"
source=("${_pkgbase}::git+https://github.com/garrett/firefox-gnome-theme.git#branch=gnome-45"
        "INSTALL.md")
sha256sums=('SKIP'
            'f0fc2ccb43b813174e329fef74ab37a8cbfecd60168dbe05ccba999cfd8d222a')

pkgver() {
  cd "${_pkgbase}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${_pkgbase}"
  install -d "${pkgdir}/usr/lib/${_pkgbase}"
  cp -ra theme userChrome.css userContent.css configuration "${pkgdir}/usr/lib/${_pkgbase}"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgbase}/README.md"
  install -Dm644 ${srcdir}/INSTALL.md "${pkgdir}/usr/share/doc/${_pkgbase}/INSTALL.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgbase}/LICENSE"
}
