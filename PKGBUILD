# Maintainer: ml <ml@visu.li>
# Contributor: Hugo Rodrigues <me@hugorodrigues.net>
pkgname=vim-ansible-git
pkgver=2.1.r0.g8da127b
pkgrel=1
pkgdesc="A vim plugin for syntax highlighting Ansible's common filetypes"
arch=('any')
url='https://github.com/pearofducks/ansible-vim'
license=('MIT' 'BSD')
groups=('vim-plugins')
depends=('vim')
makedepends=('git' 'ansible')
optdepends=('vim-ultisnips: completion support')
provides=('vim-ansible')
conflicts=('vim-ansible')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  python UltiSnips/generate.py
}

package() {
  cd "$pkgname"
  for i in ftdetect ftplugin indent syntax; do
    install -Dm644 -t "${pkgdir}/usr/share/vim/vimfiles/${i}" "$i"/*.vim
  done
  install -Dm644 -t "${pkgdir}"/usr/share/vim/vimfiles/snippets ansible.snippets
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE syntax/jinja2.vim_LICENSE
}
