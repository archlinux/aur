# Maintainer: Matt Quintanilla <matt @ matt quintanilla .xyz>
pkgname='winboat-bin'
_pkgname="winboat"
pkgver=0.9.0
pkgrel=1
pkgdesc='Run Windows apps on Linux with seamless integration'
arch=(x86_64)
url='https://www.winboat.app'
license=('MIT')
depends=('freerdp' 'gtk3' 'alsa-lib' 'nss')
optdepends=('docker: To use docker as a container runtime' 'podman-compose: To use podman as a container runtime')
install='winboat.install'
provides=("$_pkgname")
conflicts=("$_pkgname")
options=("!strip" "!debug")
source=("https://github.com/TibixDev/winboat/releases/download/v${pkgver}/winboat-${pkgver}-amd64.deb")

sha256sums=('91d4d10d173fb572fba7c30ad49a2397374e4cde1bc5b4f807573890962afe4e')



prepare() {
    bsdtar -xf data.tar.xz
}


package() {
    # Install files from deb package
    cp -r --preserve=mode,timestamps opt/ "${pkgdir}/"
    cp -r --preserve=mode,timestamps usr/ "${pkgdir}/"

    # Fix permissions if needed
    find "${pkgdir}" -type d -exec chmod 755 {} \;
    find "${pkgdir}" -type f -exec chmod 644 {} \;
    chmod 755 "${pkgdir}/opt/winboat/winboat" 2>/dev/null || true
}

