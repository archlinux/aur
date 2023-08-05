# Maintainer: Ewout van Mansom <ewout@vanmansom.name>
#
# See INSTALL.md to setup thunderbird to use this theme when installed
# in your system /usr/lib directory via pacman and this PKGBUILD.

_pkgname=thunderbird-gnome-theme
pkgname=thunderbird-gnome-theme-git
pkgver=r53.fcae3fb
pkgrel=1
pkgdesc='A GNOME theme for Thunderbird'
arch=('any')
url='https://github.com/rafaelmardojai/thunderbird-gnome-theme'
license=('Unlicense')
optdepends=('thunderbird: primary compatible e-mail client')
makedepends=('git')
install='thunderbird-gnome-theme-git.install'
source=('thunderbird-gnome-theme::git+https://github.com/rafaelmardojai/thunderbird-gnome-theme.git'
        'INSTALL.md')
sha256sums=('SKIP'
            '8238c490e2fd24957de4d96f4e523d269ea3c0c9a01cebc61827147c35075d5c')

pkgver() {
  cd "${_pkgname}"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}


prepare() {
  cd "${_pkgname}"

  # Remove unneeded files
  rm -rf "${pkgdir}/usr/lib/${_pkgname}"/{scripts,LICENSE,README.md,screenshot.png}
}

package() {
  cd "${_pkgname}"

  # Install user.js script and theme
  install -dm755 "${pkgdir}/usr/lib/${_pkgname}/"{configuration,theme}
  cp -dr --preserve=mode,timestamp configuration "${pkgdir}/usr/lib/${_pkgname}"
  cp -dr --preserve=mode,timestamp theme "${pkgdir}/usr/lib/${_pkgname}"
  install -Dm644 -t "${pkgdir}/usr/lib/${_pkgname}" userChrome.css
  install -Dm644 -t "${pkgdir}/usr/lib/${_pkgname}" userContent.css

  # Install docs & license
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" README.md
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" ${srcdir}/INSTALL.md
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" LICENSE
}
