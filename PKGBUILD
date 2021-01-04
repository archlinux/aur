# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=lightspeed-react-git
pkgver=r9.e299491
pkgrel=2
pkgdesc="React frontend for the Lightspeed project"
arch=(any)
url="https://github.com/GRVYDEV/Lightspeed-react"
license=("custom:MIT")
depends=("lightspeed-webrtc")
optdepends=("nginx: Web Server to host the static web app")
makedepends=("npm" "git")
provides=("lightspeed-react" "lightspeed-frontend")
conflicts=("lightspeed-react" "lightspeed-frontend")
source=("${pkgname}::git+https://github.com/GRVYDEV/Lightspeed-react.git")
sha512sums=('SKIP')


pkgver() {
    cd "$pkgname"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$pkgname"

    npm install --cache "${srcdir}/npm-cache"
}

build() {
    cd "$pkgname"

    npm run build
}

package() {
    cd "$pkgname"

    install -d "${pkgdir}/usr/share/webapps/lightspeed-react/"
    cp -r "build/." "${pkgdir}/usr/share/webapps/lightspeed-react"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/lightspeed-react/README.md"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
