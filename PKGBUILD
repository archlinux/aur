# Maintainer: Caleb Maclennan <caleb@alerque.com>

_project=fraunces
pkgbase=${_project}-font-git
pkgname=("ttf-$_project-variable-git") # "ttf-$_project-git" "otf-$_project-git"
pkgver=0.001
_sha=611c698e29de78d133beac7534a0ac7b914682cb
pkgrel=1
pkgdesc='A display, “Old Style” soft-serif typeface inspired by early 20th century typefaces'
arch=('any')
url="https://github.com/undercasetype/${_project^}"
license=('OFL')
makedepends=('gftools' 'git' 'fontbakery' 'python-fontmake' 'python-fonttools' 'python-ttfautohint-py' 'statmake')
source=("$pkgbase::git+$url.git")
sha256sums=('SKIP')

prepare() {
    cd "$pkgbase"
    rm -f fonts/* # Repo has binary artifacts from old builds
}

build() {
    cd "$pkgbase/sources"
    sh build.sh ||: # Self check fails because static fonts don't generate yet
}

package_otf-fraunces-git() {
    :
}

package_ttf-fraunces-git() {
    :
}

package_ttf-fraunces-variable-git() {
    pkgdesc+=" (variable)"
    cd "$pkgbase"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" fonts/*\[*\].ttf
    install -Dm644 OFL.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
