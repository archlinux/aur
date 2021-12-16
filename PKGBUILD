# Maintainer: ml <>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Hugo Rodrigues <me@hugorodrigues.net>
pkgname=vim-ansible-git
pkgver=3.2.r3.g469e55b
pkgrel=1
pkgdesc="A vim plugin for syntax highlighting Ansible's common filetypes"
arch=('any')
url='https://github.com/pearofducks/ansible-vim'
license=('MIT' 'BSD')
groups=('vim-plugins')
depends=('python-jinja' 'vim')
makedepends=('git' 'ansible')
optdepends=('vim-ultisnips: for ansible snippets')
provides=('vim-ansible')
conflicts=('vim-ansible')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  # generating a reproducible UltiSnips snippet file:
  # https://github.com/pearofducks/ansible-vim/pull/105
  python UltiSnips/generate.py --style=dictionary
}

package() {
  cd "$pkgname"
  install -vDm 644 ftdetect/*.vim \
    -t "${pkgdir}/usr/share/vim/vimfiles/ftdetect/"
  install -vDm 644 ftplugin/*.vim \
    -t "${pkgdir}/usr/share/vim/vimfiles/ftplugin/"
  install -vDm 644 indent/*.vim -t "${pkgdir}/usr/share/vim/vimfiles/indent/"
  install -vDm 644 syntax/*.vim \
    -t "${pkgdir}/usr/share/vim/vimfiles/syntax/"
  install -vDm 644 ansible.snippets \
    -t "${pkgdir}/usr/share/vim/vimfiles/UltiSnips/"
  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm 644 syntax/*.vim_LICENSE \
    -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
