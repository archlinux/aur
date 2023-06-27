# Maintainer: taotieren <admin@taotieren.com>

pkgname=poedit-git
pkgver=3.3.2.oss.r0.gb4688c518
pkgrel=1
epoch=
pkgdesc="Translations editor for Mac, Windows and Unix"
arch=('x86_64')
url="https://github.com/vslavik/poedit"
license=('MIT')
groups=()
depends=(aspell
        cld2
        cpprestsdk
        expat
        gettext
        gtkspell3
        hunspell
        nlohmann-json
        lucene++
        pugixml
        wxwidgets-gtk3
        webkit2gtk)
makedepends=(automake
            ccache
            boost
            git
            icu
            libjpeg-turbo
            libnotify
            libsecret
            zlib)
checkdepends=()
optdepends=()
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}::git+${url}.git")
noextract=()
sha256sums=('SKIP')
#validpgpkeys=()

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname}"

    ./bootstrap
    ./configure --prefix=/usr \
        --libexecdir=/usr/lib/poedit \
        --with-cld2=yes \
        --with-cpprest=yes

    make CPPFLAGS+=' -DUCHAR_TYPE=uint16_t'
}

package() {
    cd "${srcdir}/${pkgname}"

    make DESTDIR="${pkgdir}" install
    install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
