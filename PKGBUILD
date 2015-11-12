# Maintainer: Eli Schwartz <eschwartz93@gmail.com>
# Contributor: Thiago Perrotta <echo dGhpYWdvcGVycm90dGE5NUBnbWFpbC5jb20K | base64 -d >

pkgname=lastpass-cli-git
pkgver=0.6.0.r25.gf2acef6
pkgrel=1
pkgdesc="LastPass command line interface tool (git version)"
arch=('i686' 'x86_64')
url="https://lastpass.com/"
license=('GPL2')
depends=('openssl' 'curl' 'libxml2')
makedepends=('asciidoc' 'git')
optdepends=('xclip: clipboard support'
            'pinentry: securely read passwords')
source=("git://github.com/lastpass/${pkgname%-git}.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    make all doc
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    make DESTDIR="${pkgdir}/" install install-doc
}
