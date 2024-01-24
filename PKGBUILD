# Maintainer: snogard <snogardb at gmail dot com>


pkgname=amdgpu-vulkan-switcher-git
pkgver=r1.fadfff5
pkgrel=1
pkgdesc="Select needed vulkan implementation with vk_radv, vk_amdvlk or vk_pro prefix"
url=https://github.com/CosmicFusion/amdgpu-vulkan-switcher
arch=(any)
license=(GPL)
depends=(amdgpu-opengl-switcher-git)
makedepends=(git)
source=("git+https://github.com/CosmicFusion/amdgpu-vulkan-switcher.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/amdgpu-vulkan-switcher"
    if $(git describe --long --tags > /dev/null ) ; then
        git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    fi
}

package() {
    install -Dm755 "${srcdir}/amdgpu-vulkan-switcher/src/usr/bin/vk_radv" "${pkgdir}/usr/bin/vk_radv"
    install -Dm755 "${srcdir}/amdgpu-vulkan-switcher/src/usr/bin/vk_amdvlk" "${pkgdir}/usr/bin/vk_amdvlk"
    install -Dm755 "${srcdir}/amdgpu-vulkan-switcher/src/usr/bin/vk_pro" "${pkgdir}/usr/bin/vk_pro"
    install -Dm755 "${srcdir}/amdgpu-vulkan-switcher/src/usr/bin/vk_legacy" "${pkgdir}/usr/bin/vk_legacy"
    install -Dm644 "${srcdir}/amdgpu-vulkan-switcher/src/usr/share/bash-completion/completions/vk_radv" "${pkgdir}/usr/share/bash-completion/completions/vk_radv"
    install -Dm644 "${srcdir}/amdgpu-vulkan-switcher/src/usr/share/bash-completion/completions/vk_amdvlk" "${pkgdir}/usr/share/bash-completion/completions/vk_amdvlk"
    install -Dm644 "${srcdir}/amdgpu-vulkan-switcher/src/usr/share/bash-completion/completions/vk_pro" "${pkgdir}/usr/share/bash-completion/completions/vk_pro"
    install -Dm644 "${srcdir}/amdgpu-vulkan-switcher/src/usr/share/bash-completion/completions/vk_legacy" "${pkgdir}/usr/share/bash-completion/completions/vk_legacy"
}
