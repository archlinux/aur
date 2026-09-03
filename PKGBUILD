# Maintainer: Matt Quintanilla <matt @ matt quintanilla .xyz>
pkgname='winboat-bin'
_pkgname="winboat"
pkgver=0.9.2
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

sha256sums=('c01bfbabef6c1c57895dfb3165d4ca7c6912d2f63c67f61b2c2dd3e69449f0ba')



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

