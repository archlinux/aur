# Maintainer: Matthias Lisin <ml@visu.li>
# Contributor: Hugo Rodrigues <me@hugorodrigues.net>

pkgname=ansible-vim-git
pkgver=2.0.r5.gf1c9be3
pkgrel=1
pkgdesc="A vim plugin for syntax highlighting Ansible's common filetypes"
arch=('any')
url="https://github.com/pearofducks/ansible-vim"
license=('MIT')
depends=('vim-runtime')
makedepends=('git' 'ansible')
source=("${pkgname}::git+${url}.git")
sha512sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname}"
    python UltiSnips/generate.py --output ansible.snippets
}

package() {
    cd "${srcdir}/${pkgname}"
    for _dir in ftdetect ftplugin indent syntax; do
        install -D -m644 -t "${pkgdir}/usr/share/vim/vimfiles/$_dir" $_dir/*.vim
    done
    install -D -m644 -t "${pkgdir}"/usr/share/vim/vimfiles/snippets ansible.snippets 
}

