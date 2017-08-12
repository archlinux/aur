# Maintainer: Hugo Rodrigues <me@hugorodrigues.net>

pkgname="ansible-vim-git"
pkgver=5f3eb14
pkgrel=3
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
    git checkout "${pkgver}"
    for _dir in *; do
        if [ -d "${_dir0}" ] && [ "${_dir}" != "UltiSnips" ]; then
            for _file in $(find "${_dir}" -name "*.vim"); do
                install -D -m644 "${_file}" "${pkgdir}"/usr/share/vim/vimfiles/"${_file}"
            done
        fi
    done
    cd UltiSnips
    python2 generate.py
    install -D -m644 ansible.snippets "${pkgdir}"/usr/share/vim/vimfiles/snippets/ansible.snippets
}

