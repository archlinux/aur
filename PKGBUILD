# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: Rooki <aur at rooki dot xyz>
# Contributor: Kainoa Kanter <kainoa@t1c.dev>

pkgname=anytype-alpha-bin
_pkgname=anytype
pkgver=0.52.4
pkgrel=1
pkgdesc="Operating environment for the new internet (Anytype)"
arch=('x86_64')
url="https://anytype.io"
license=('custom')
depends=('bash' 'glibc' 'gcc-libs' 'libsecret' 'glib2' 'hicolor-icon-theme')
makedepends=('jq')
optdepends=('org.freedesktop.secrets: for not having to sign in each time')
provides=('anytype')
conflicts=('anytype'
           'anytype-legacy'
           'anytype-electron-bin'
           'anytype-bin')
options=('!strip' '!debug')
source=(
	"anytype-${pkgver}.deb::https://github.com/anyproto/anytype-ts/releases/download/v${pkgver}/anytype_${pkgver}_amd64.deb"
	"LICENSE-${pkgver}.md::https://raw.githubusercontent.com/anyproto/anytype-ts/refs/tags/v${pkgver}/LICENSE.md"
)
sha256sums=('c6fb8aafde67db244503ac33f8c83bd7f58377963a9d61e2c44890883910dd2c'
            'daad9eb95adc6262b07115ba2cf87cd4c64acaca4b45d48e0fd3b15a72a31dc1')

pkgver() {
    curl -sI "https://github.com/anyproto/anytype-ts/releases/latest" | 
    grep -i location | 
    sed 's|.*/v||;s|\r||'
}

package() {
    cd "${pkgdir}"
    tar -xf "${srcdir}/data.tar.xz"
    
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
