# Maintainer: Brieuc Dubois <focus dot aur at bhasher dot com> 
pkgname=focus-desktop-bin
pkgver=0.3.2
pkgrel=1
pkgdesc="Focus is an open-source, Kanban-style project management tool, emphasizing simplicity and efficiency."
arch=('x86_64')
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
url="https://git.bhasher.com/bhasher/focus"

depends=(
    'webkit2gtk'
    'gtk3'
    'cairo'
    'glib2'
    'hicolor-icon-theme'
    'gdk-pixbuf2'
    'libsoup'
    'gcc-libs'
    'glibc'
    'pango'
)

source=(
    "focus_${pkgver}_amd64.deb::https://git.bhasher.com/Bhasher/focus/releases/download/v${pkgver}/focus_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://git.bhasher.com/Bhasher/focus/raw/branch/master/LICENSE.md"
)

sha256sums=(
    '64dc3fbd2476ef5ff9b0705c6ec287657ef7ce96c4b72d063088eb05c519f227'
    '00f70f9c4cb1c351877b690002c21564dc022f7b5d7fd1273ff52c5911356384'
)

build() {
    bsdtar -xf "${srcdir}/data.tar.gz"
}

package() {
    install -Dm755 "${srcdir}/usr/bin/focus" "${pkgdir}/usr/bin/focus"
    install -Dm644 "${srcdir}/usr/share/applications/focus.desktop" "${pkgdir}/usr/share/applications/focus.desktop"
    for _icons in 32x32 128x128 256x256@2;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/focus.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps/focus.png"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

