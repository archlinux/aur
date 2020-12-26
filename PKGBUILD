# Maintainer: Fabian Bornschein <plusfabi-cat-gmail-dog-com>

pkgbase="preconf-intel-nvidia-prime-render-offloading"
pkgname=("preconf-intel-nvidia-prime-render-offloading-common"
        "preconf-intel-nvidia-prime-render-offloading-linux"
        "preconf-intel-nvidia-prime-render-offloading-linux-dkms"
        "preconf-intel-nvidia-prime-render-offloading-linux-lts"
        "preconf-intel-nvidia-prime-render-offloading-linux-zen"
)
pkgver=1
pkgrel=0
url=https://wiki.archlinux.org/index.php/PRIME
arch=('x86_64')
license=('GPL3')
source=(
    "71-kmod-intel.conf"
    "71-kmod-nouveau-blacklist.conf"
    "71-kmod-nvidia.conf"
    "71-kmod-nvidia-pwm.conf"
    "71-nvidia-mkinitcpio.hook"
    "90-nvidia-prime-powermanagement.rules"
    )
sha512sums=('a8ef4becd2ab00a98d6e024d4755302d0553f963859c346c84f98789b67c40c0fad89323e8ea8ebb61a0c24a07d7bc967102700e7e8500691714d1fbed9059dc'
            'c432e01cb6d684c9f4542403b6be906ed2d4696b06d0f20a07a4988c24ae63cb646a200ec4c5d61a34ca77a89495cd9917276157242e790b6e8e86ec4553e8e8'
            '4bf1a0f773a7bb3a0eca5e9a448d7a0622003e5251932e13a68854d3b45a2b7d174cb8cf83cf320676587678fb376dab0f74d4c6996ae74c403e5435dcea1e4c'
            '20c45d591afeb24327ccdd62ddef64fd2533cb1c5396e5030e3443d6ee0b86740cc3383b3c74f088088058f7c9281bc0e93b9d115ff9f8525f49e205641c538f'
            '924a112b90aa694c67fec7fc54dd1c2191da005b8c6ebc055382b4d4559de3697ab1d56903f0c51eedced08595d9aa66a49c97840b33993735e1b6df9864d2cf'
            '316104ac3c1a14d12679521196930e107405c77d632ed1123be9cbc7ddb9c64b123d9fee6e9e5b6d630ad3669446e219909189477d7f68696612bebda791fb3b')

package_preconf-intel-nvidia-prime-render-offloading-common(){
    pkgdesc="common files for an intel-nvidia prime system"
    depends=("nvidia-prime" "nvidia-settings" "nvidia-utils" "opencl-nvidia" "lib32-nvidia-utils" "lib32-opencl-nvidia")
    optdepends=(
        "preconf-intel-nvidia-prime-render-offloading-linux: Configuration for default Arch Kernel"
        "preconf-intel-nvidia-prime-render-offloading-linux-zen: Configuration for ZEN Kernel"
        "preconf-intel-nvidia-prime-render-offloading-linux-lts: Configuration for LTS Kernel"
        "preconf-intel-nvidia-prime-render-offloading-linux-dkms: Generic Kernel, DKMS Configuration")

    cd "${srcdir}"
    ## Drivers load up on boot
    install -Dm 644 "${srcdir}/71-kmod-intel.conf" "${pkgdir}/usr/lib/modules-load.d/71-kmod-intel.conf"
    install -Dm 644 "${srcdir}/71-kmod-nvidia.conf" "${pkgdir}/usr/lib/modules-load.d/71-kmod-nvidia.conf"
    ## Blacklist and PWM options
    install -Dm 644 "${srcdir}/71-kmod-nouveau-blacklist.conf" "${pkgdir}/usr/lib/modprobe.d/71-kmod-nouveau-blacklist.conf"
    install -Dm 644 "${srcdir}/71-kmod-nvidia-pwm.conf" "${pkgdir}/usr/lib/modprobe.d/71-kmod-nvidia-pwm.conf"
    ## udev rules
    install -Dm 644 "${srcdir}/90-nvidia-prime-powermanagement.rules" "${pkgdir}/usr/lib/udev/rules.d/90-nvidia-prime-powermanagement.rules"
    ## ALPM Hook
    install -Dm 644 "${srcdir}/71-nvidia-mkinitcpio.hook" "${pkgdir}/usr/share/libalpm/hooks/71-nvidia-mkinitcpio.hook"
}

package_preconf-intel-nvidia-prime-render-offloading-linux(){
    pkgdesc="configures an intel-nvidia prime system for linux"
    depends=("linux" "nvidia" "preconf-intel-nvidia-prime-render-offloading-common")
    install=install_kernel
}

package_preconf-intel-nvidia-prime-render-offloading-linux-dkms(){
    pkgdesc="configures an intel-nvidia prime system with dkms"
    depends=("nvidia-dkms" "preconf-intel-nvidia-prime-render-offloading-common")
    install=install_dkms
}

package_preconf-intel-nvidia-prime-render-offloading-linux-lts(){
    pkgdesc="configures an intel-nvidia prime system for linux-lts"
    depends=("linux-lts" "nvidia-lts" "preconf-intel-nvidia-prime-render-offloading-common")
    install=install_kernel
}

package_preconf-intel-nvidia-prime-render-offloading-linux-zen(){
    pkgdesc="configures an intel-nvidia prime system for linux-zen"
    depends=("linux-zen" "linux-zen-headers" "nvidia-dkms" "preconf-intel-nvidia-prime-render-offloading-common")
    install=install_kernel
}
