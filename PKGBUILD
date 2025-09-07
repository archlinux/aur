# Maintainer: Matt Quintanilla <matt @ matt quintanilla .xyz>
pkgname='winboat-bin'
_pkgname="winboat"
pkgver='0.7.5'
pkgrel='1'
pkgdesc='Run Windows apps on Linux with seamless integration'
arch=(x86_64)
url='https://www.winboat.app'
license=('MIT')
depends=('docker' 'docker-compose' 'freerdp' 'gtk3' 'alsa-lib' 'nss')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=("!strip" "!debug")
source=("https://github.com/TibixDev/winboat/releases/download/v${pkgver}/winboat-${pkgver}-amd64.deb")

sha256sums=('46ec27913bb35b6b1b25d287721b8205383f38b376866eb11bc7c67ee2a0d695')



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

