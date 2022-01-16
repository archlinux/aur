# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=vim-signify-git
_pkgname=vim-signify
pkgver=r770.69498f6
pkgrel=1
pkgdesc='Show a diff using Vim its sign column'
arch=('any')
url='https://github.com/mhinz/vim-signify'
license=('MIT')
depends=('vim-plugin-runtime')
optdepends=('git: git support'
            'yadm: yadm support'
            'mercurial: mercurial support'
            'subversion: subversion support'
            'breezy: breezy support'
            'darcs: darcs support'
            'fossil: fossil support'
            'cvs: cvs support'
            'rcs: rcs support'
            'p4: perforce support'
            'tee-clc: tfs support')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git#branch=master")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/${_pkgname}"
    find autoload doc plugin -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/usr/share/vim/vimfiles/{}" \;
    install -Dm 644 "${srcdir}/${_pkgname}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
