# Maintainer: taotieren <admin@taotieren.com>

pkgname=poedit-git
pkgver=3.2.1.oss.r1.g992181a6f
pkgrel=1
epoch=
pkgdesc="Poedit: cross-platform translation editor"
arch=('x86_64')
url="https://github.com/vslavik/poedit"
license=('MIT')
groups=()
depends=(gtkspell3 lucene++ wxwidgets-gtk3 webkit2gtk)
makedepends=(boost)
checkdepends=()
optdepends=('cld2: Compact Language Detector 2')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname%-git}::git+${url}.git")
noextract=()
sha256sums=('SKIP')
#validpgpkeys=()

pkgver() {
    cd "${srcdir}/${pkgname%-git}"

    git describe --long --tags | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname%-git}"

    ./bootstrap
    ./configure --prefix=/usr --libexecdir=/usr/lib/poedit
    make CPPFLAGS+=' -DUCHAR_TYPE=uint16_t'
}

package() {
    cd "${srcdir}/${pkgname%-git}"

    make DESTDIR="${pkgdir}" install
    install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
