# Maintainer: Sainnhe Park <sainnhe@gmail.com>
pkgname=vim-signify-git
_pkgname=vim-signify
pkgver=legacy.r60.gc3d450e
pkgrel=1
pkgdesc='Show a diff using Vim its sign column'
arch=('any')
url='https://github.com/mhinz/vim-signify'
license=('MIT')
depends=('vim')
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
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}/${_pkgname}"
    vim -es --cmd ":helptags doc" --cmd ":q"
    find autoload doc plugin -type f -exec \
        install -Dm 644 '{}' "${pkgdir}/usr/share/vim/vimfiles/pack/${_pkgname}/start/${_pkgname}/{}" \;
    install -Dm 644 "${srcdir}/${_pkgname}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
