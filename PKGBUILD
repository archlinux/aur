# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=lightspeed-react-git
pkgver=r31.f396a1a
pkgrel=1
pkgdesc="React frontend for the Lightspeed project"
arch=(any)
url="https://github.com/GRVYDEV/Lightspeed-react"
license=("custom:MIT")
optdepends=("nginx: Web Server to host the static web app")
makedepends=("npm" "git")
provides=("lightspeed-react" "lightspeed-frontend")
conflicts=("lightspeed-react" "lightspeed-frontend")
backup=("etc/webapps/lightspeed-react/config.json")
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

    install -d "${pkgdir}/usr/share/webapps/lightspeed-react"
    cp -r "build/." "${pkgdir}/usr/share/webapps/lightspeed-react"

    install -Dm644 "build/config.json" "${pkgdir}/etc/webapps/lightspeed-react/config.json"
    ln -sf "/etc/webapps/lightspeed-react/config.json" "${pkgdir}/usr/share/webapps/lightspeed-react/config.json"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/lightspeed-react/README.md"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
