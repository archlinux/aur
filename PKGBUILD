# Maintainer: Hugo Rodrigues <me@hugorodrigues.net>

pkgname="ansible-vim-git"
pkgver=5f3eb14
pkgrel=2
pkgdesc="A vim plugin for syntax highlighting Ansible's common filetypes "
arch=('any')
url='https://github.com/pearofducks/ansible-vim'
license=('MIT')
depends=('vim')
makedepends=('git' 'ansible')
source=("${pkgname}::git+${url}.git")
md5sums=('SKIP')

package() {
    cd "${srcdir}/${pkgname}"
    git checkout $pkgver
    for dir in *; do
        if [ -d $dir ] && [ "$dir" != "UltiSnips" ]; then
            for file in $(find $dir -name "*.vim"); do                                 
                install -D -m644 ${file} ${pkgdir}/usr/share/vim/vimfiles/${file}
            done
        fi
    done
    cd UltiSnips
    python2 generate.py
    install -D -m644 ansible.snippets ${pkgdir}/usr/share/vim/vimfiles/snippets/ansible.snippets
}

