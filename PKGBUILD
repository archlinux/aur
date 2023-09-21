# Maintainer: Mingi Sung <fiestalake@disroot.org>
# Contributor: Pedro Henrique <pedro00dk@gmail.com>
_pkgname=nvidia-exec
pkgname=${_pkgname}-git
pkgver=v0.1.2
pkgrel=1
pkgdesc="Run programs in nvidia optimus setups with power management for Xorg and Wayland without log out"
arch=("x86_64")
url="https://github.com/pedro00dk/nvidia-exec"
license=('GPL')
depends=('NVIDIA-MODULE' 'jq' 'lshw' 'lsof')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd ${_pkgname}
    git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

package() {
    cd "${_pkgname}"
    install -Dm 755 nvx "${pkgdir}/usr/bin/nvx"
    # install -Dm 755 nvx-suspend-restore "${pkgdir}/usr/lib/systemd/system-sleep/nvx-suspend-restore"
    install -Dm 644 nvx.service "${pkgdir}/usr/lib/systemd/system/nvx.service"
    install -Dm 644 modprobe.conf "${pkgdir}/usr/lib/modprobe.d/nvx.conf"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

