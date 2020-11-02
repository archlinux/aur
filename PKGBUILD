# Maintainer: Sainnhe Park <sainnhe@gmail.com>
_packdir="usr/share/vim/vimfiles/pack/markdown-preview/start/markdown-preview"
pkgname="vim-markdown-preview-git"
url='https://github.com/iamcco/markdown-preview.nvim'
pkgdesc='markdown preview plugin for (neo)vim'
pkgver=r138.94101ef
pkgrel=1
provides=('vim-markdown-preview')
conflicts=('vim-markdown-preview')
arch=('any')
depends=('vim' 'nodejs')
makedepends=('yarn' 'git')
license=('unknown')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/markdown-preview.nvim"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/markdown-preview.nvim"
    cd app && yarn install --preferred-cache-folder "${srcdir}/.cache" && cd ..
    find app autoload plugin -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/${_packdir}/{}" \;
    find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
    chown -R root:root "${pkgdir}"
}
