# Maintainer: Valters Tomsons <valters.tomsons at protonmail dot com>

pkgname="dsbattery"
pkgver=1.2.1
pkgrel=1
pkgdesc="DualShock 4 controller utility for status bars"
arch=('x86_64' 'aarch64')
url='https://github.com/valters-tomsons/dsbattery'
license=('MIT')

makedepends=('dotnet-sdk>=5.0.0')
optdepends=('bluez-tools: disconnect support')

options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/valters-tomsons/dsbattery/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('2642c5a91c530a6b89a25dc5a490340d721f1b2f1ffcebc9393bb7cc56ef86bd')

_outputdir="Release"

build() {
    cd "$pkgname-$pkgver"

    # Determine RID for build
    case $CARCH in "aarch64") RID=arm64;;
    "x86_64") RID=x64;;
    esac
    
    dotnet publish -c Release -r linux-"${RID}" -o="${_outputdir}"
}

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/${_outputdir}/$pkgname" "$pkgdir/usr/bin/${pkgname}"
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}