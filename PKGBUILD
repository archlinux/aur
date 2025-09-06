# Maintainer: Matt Quintanilla <matt @ matt quintanilla .xyz>
pkgname='winboat-bin'
pkgver='0.7.3'
pkgrel='1'
pkgdesc='Run Windows apps on Linux with seamless integration'
arch=(x86_64)
url='https://github.com/TibixDev/winboat'
license=('MIT')
depends=('docker' 'docker-compose' 'freerdp' 'gtk3' 'alsa-lib' 'nss')
provides=("$pkgname")
conflicts=("$pkgname")
options=("!strip" "!debug")
source=("https://github.com/TibixDev/winboat/releases/download/v${pkgver}/winboat-${pkgver}-amd64.deb")

sha256sums=('482e4786a745980abc1da4874057793afb075bfc0475a9e4506c6db246d2cefe')



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

