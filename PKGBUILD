# Author: Kyle Manna <kyle(at)kylemanna(dot)com>
#
# Upstream: https://github.com/bitpay/copay

pkgname=copay
pkgver=1.4.0
pkgrel=1
pkgdesc="Copay Bitcoin Wallet"
#arch=('i686' 'x86_64')
arch=('x86_64')
url="https://copay.io"
license=('MIT')
depends=('')

# For some reason, stripping the massive copay binary breaks the app
options=('!strip')

source_x86_64=("https://github.com/bitpay/copay/releases/download/v${pkgver}/copay-linux64.zip")
#source_i686=("https://github.com/bitpay/copay/releases/download/v${pkgver}/copay-linux32.zip")

sha512sums_x86_64=('b2cf1bc3f5af2f171447037d8aa5063f9cdc26443a06c7dd11a1ea2f2b8f5fa29e9fad024b95549cc8434674bcfe566944465a1b821773a2ea31a57116c5dd13')
#sha512sums_i686=('')

# TODO: add signature files
# TODO: test 32 bit build (maybe)

package() {

    # Prep destination
    mkdir -p ${pkgdir}/opt/copay
    cd ${pkgdir}/opt/copay

    # Unzip the binary package
    unzip ${startdir}/copay-linux*.zip
    
    # Remove arch suffix 
    mv copay-linux*/* .
    rmdir copay-linux*

    # Symlink in to the default PATH
    mkdir -p ${pkgdir}/usr/bin
    ln -s /opt/copay/copay ${pkgdir}/usr/bin/copay
}
