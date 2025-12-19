# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: Rooki <aur at rooki dot xyz>
# Contributor: Kainoa Kanter <kainoa@t1c.dev>

pkgname=anytype-alpha-bin
_pkgname=anytype
pkgver=0.52.16_alpha
pkgrel=1
pkgdesc="Operating environment for the new internet (Anytype)"
arch=('x86_64')
url="https://anytype.io"
license=('custom')
depends=('bash' 'glibc' 'gcc-libs' 'libsecret' 'glib2' 'hicolor-icon-theme')

optdepends=('org.freedesktop.secrets: for not having to sign in each time')
provides=('anytype')
conflicts=('anytype'
           'anytype-legacy'
           'anytype-electron-bin'
           'anytype-bin')
options=('!strip' '!debug')
source=(
	"anytype-${pkgver//_/-}.deb::https://github.com/anyproto/anytype-ts/releases/download/v${pkgver//_/-}/anytype_${pkgver//_/-}_amd64.deb"
	"LICENSE-${pkgver//_/-}.md::https://raw.githubusercontent.com/anyproto/anytype-ts/refs/tags/v${pkgver//_/-}/LICENSE.md"
)
sha256sums=('85c5aa038946e6c4c5ac28c6ea2218800cc12b1e544e8661e1e528c82fa1512f'
            'daad9eb95adc6262b07115ba2cf87cd4c64acaca4b45d48e0fd3b15a72a31dc1')

latestver() {
    curl -sI "https://github.com/anyproto/anytype-ts/releases/latest" |
    grep -i location |
    sed 's|.*/v||;s|\r||;s|-|_|g'
}

package() {
    cd "${pkgdir}"
    tar -xf "${srcdir}/data.tar.xz"
    
    install -Dm644 "${srcdir}/LICENSE-${pkgver//_/-}.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
