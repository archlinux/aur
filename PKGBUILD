# Maintainer: William Turner <willtur.will@gmail.com>
pkgname=vim-ensime-git
pkgver=0.2.r552.caa734e
pkgrel=1
pkgdesc='Ensime for vim.'
arch=('any')
url='http://ensime.org/editors/vim/'
license=('MIT')
groups=('vim-plugins')
depends=('vim-runtime' 'vim-scala-git' 'python' 'python-websocket-client' 'python-sexpdata' 'java-environment')
makedepends=('git')
optdepends=('sbt: old sbt-ensime plugin (<1.12.0) support')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/ensime/ensime-vim.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/ensime-vim"
  printf "%s.r%s.%s" \
    "$(grep -oP '(?<="version" : ")[^"]+' addon-info.json)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/ensime-vim"
  install -d -m755 "${pkgdir}/usr/share/vim/vimfiles"
  find * -maxdepth 0 -type d -exec cp -rt "${pkgdir}/usr/share/vim/vimfiles/" '{}' \+
}
