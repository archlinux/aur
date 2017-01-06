# Maintainer: William Turner <willtur.will@gmail.com>
pkgname=vim-wakatime-git
pkgver=4.0.12.r301.5fb3410
pkgrel=3
pkgdesc='Vim plugin for automatic time tracking and metrics generated from your programming activity.'
arch=('any')
url='https://github.com/wakatime/vim-wakatime'
license=('BSD')
groups=('vim-plugins')
depends=('vim-runtime' 'python')
makedepends=('git')
optdepends=('subversion: svn project info support')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/wakatime/vim-wakatime.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/vim-wakatime"
  printf "%s.r%s.%s" \
    "$(grep -oP "(?<=VERSION = ')[^']+" plugin/wakatime.vim)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/vim-wakatime"
  install -d -m755 "${pkgdir}/usr/share/vim/vimfiles"
  find * -maxdepth 0 -type d -exec cp -rt "${pkgdir}/usr/share/vim/vimfiles/" '{}' \+
}
