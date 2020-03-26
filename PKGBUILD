# Maintainer: ml <ml@visu.li>
pkgname=vim-ansible
pkgver=2.1
pkgrel=1
pkgdesc="A vim plugin for syntax highlighting Ansible's common filetypes"
arch=('any')
url='https://github.com/pearofducks/ansible-vim'
license=('MIT')
groups=('vim-plugins')
depends=('vim')
makedepends=('ansible' 'python')
optdepends=('vim-ultisnips: completion support')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('e93c7c69146135cba5351aabacd5c68cd9b633fd66293629f5a595610304ca25')

build() {
  cd "ansible-vim-${pkgver}"
  python UltiSnips/generate.py
}

package() {
  cd "ansible-vim-${pkgver}"
  for i in ftdetect ftplugin indent syntax; do
    install -Dm644 -t "${pkgdir}/usr/share/vim/vimfiles/${i}" "$i"/*.vim
  done
  install -Dm644 -t "${pkgdir}"/usr/share/vim/vimfiles/snippets ansible.snippets
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE syntax/jinja2.vim_LICENSE
}
