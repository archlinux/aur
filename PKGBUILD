# Maintainer: Henry-Joseph Audéoud <h.audeoud+aur@gmail.com>

pkgname=mediawiki-mathoid
_pkgname=${pkgname#mediawiki-}
pkgver=0.7.5
pkgrel=1
pkgdesc="Using MathJax and PhantomJS to create SVGs and MathML server side with minimum overhead."
source=("https://registry.npmjs.org/${_pkgname}/-/${_pkgname}-${pkgver}.tgz")
noextract=("${_pkgname}-${pkgver}.tgz")
sha1sums=('65df32ba434e9cf0ccf988b63c9bb1049e30c669')
arch=(any)
url="https://github.com/wikimedia/mathoid"
license=(Apache)
depends=(nodejs librsvg)
makedepends=(npm jq)

package() {
    # FIXME: should dependencies into node_modules subdirectory be embedded, or
    # should they be declared as dependencies at the Arch Linux packaging
    # level?

    # FIXME: Should I user --user root in the npm install command?  I saw it in
    # some PKGBUILDs, but does not understand the aim.  Also nothing is given
    # in that topic in the Arch Linux wiki.

    npm install --global \
        --prefix "$pkgdir"/usr \
        "${srcdir}/${_pkgname}-${pkgver}.tgz"

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "$pkgdir"
}

# TODO:
#check() {
# - Mathoid's "npm test"?
# - Test vector from "https://www.mediawiki.org/wiki/Manual:Mathoid#Testing"?
#}
