# Maintainer: Venik1821 <venik1821@gmail.com>
pkgname=aniship-night-git
_pkgname=aniship-night
pkgver=r1.0.0
pkgrel=1
pkgdesc="AniShip Night - anime streaming client (development version)"
arch=('x86_64')
url="https://github.com/Veniamin668/AniShip-fork"
license=('MIT')
depends=('nodejs' 'npm' 'gtk3' 'nss' 'libxss')
makedepends=('git')
provides=('aniship-night')
conflicts=('aniship-night-bin')

source=("git+https://github.com/Veniamin668/AniShip-fork.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/AniShip-fork"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/AniShip-fork"
    mkdir -p "${pkgdir}/opt/${_pkgname}"
    cp -r * "${pkgdir}/opt/${_pkgname}/"
    
    mkdir -p "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${_pkgname}" << 'EOF'
#!/bin/bash
cd /opt/aniship-night
npm start
EOF
    chmod +x "${pkgdir}/usr/bin/${_pkgname}"
}
