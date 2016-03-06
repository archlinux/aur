# Author: Kyle Manna <kyle(at)kylemanna(dot)com>
#
# Upstream: https://github.com/bitpay/copay

pkgname=copay
pkgver=1.9.2
pkgrel=1
pkgdesc="Copay Bitcoin Wallet"
#arch=('i686' 'x86_64')
arch=('x86_64')
url="https://copay.io"
license=('MIT')
depends=('')

# For some reason, stripping the massive copay binary breaks the app
options=('!strip')

source_x86_64=("https://github.com/bitpay/copay/releases/download/v${pkgver}/Copay-linux.zip"
               "https://github.com/bitpay/copay/releases/download/v${pkgver}/Copay-linux.zip.sig"
              )

md5sums_x86_64=('c6cf65d74c4a069cb2fb6cc19da9805c'
                'SKIP')

# gpg --recv-keys 9D17E656BB3B6163AE9D71725CD600A61112CFA1
validpgpkeys=('9D17E656BB3B6163AE9D71725CD600A61112CFA1')

# TODO: test 32 bit build (maybe)

package() {

    # Prep destination
    mkdir -p ${pkgdir}/opt/copay
    cd ${pkgdir}/opt/copay

    # Unzip the binary package
    unzip ${startdir}/Copay-linux.zip
    
    # Remove arch suffix 
    mv copay-linux/* .
    rmdir copay-linux

    # Symlink in to the default PATH
    mkdir -p ${pkgdir}/usr/bin
    ln -s /opt/copay/Copay ${pkgdir}/usr/bin/copay
}
