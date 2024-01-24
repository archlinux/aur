# Maintainer: snogard <snogardb at gmail dot com>


pkgname=amdgpu-opengl-switcher-git
pkgver=1.0.r9.g7fcbd69
pkgrel=1
pkgdesc="Select needed OpenGL implementation with gl_mesa, gl_zink or gl_pro prefix"
url=https://github.com/CosmicFusion/amdgpu-opengl-switcher
arch=(any)
license=(GPL)
depends=(bash)
makedepends=(git)
source=("git+https://github.com/CosmicFusion/amdgpu-opengl-switcher.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/amdgpu-opengl-switcher"
    if $(git describe --long --tags > /dev/null ) ; then
        git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    fi
}

package() {
    install -Dm755 "${srcdir}/amdgpu-opengl-switcher/src/usr/bin/gl_zink" "${pkgdir}/usr/bin/gl_zink"
    install -Dm755 "${srcdir}/amdgpu-opengl-switcher/src/usr/bin/gl_pro" "${pkgdir}/usr/bin/gl_pro"
    install -Dm755 "${srcdir}/amdgpu-opengl-switcher/src/usr/bin/gl_mesa" "${pkgdir}/usr/bin/gl_mesa"
    install -Dm644 "${srcdir}/amdgpu-opengl-switcher/src/usr/share/bash-completion/completions/gl_zink" "${pkgdir}/usr/share/bash-completion/completions/gl_zink"
    install -Dm644 "${srcdir}/amdgpu-opengl-switcher/src/usr/share/bash-completion/completions/gl_pro" "${pkgdir}/usr/share/bash-completion/completions/gl_pro"
    install -Dm644 "${srcdir}/amdgpu-opengl-switcher/src/usr/share/bash-completion/completions/gl_mesa" "${pkgdir}/usr/share/bash-completion/completions/gl_mesa"
}
