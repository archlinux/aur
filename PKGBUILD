# Author: Kyle Manna <kyle(at)kylemanna(dot)com>
#
# Upstream: https://github.com/bitpay/copay

pkgname=copay
pkgver=1.6.3
pkgrel=1
pkgdesc="Copay Bitcoin Wallet"
#arch=('i686' 'x86_64')
arch=('x86_64')
url="https://copay.io"
license=('MIT')
depends=('')

# For some reason, stripping the massive copay binary breaks the app
options=('!strip')

source_x86_64=("https://github.com/bitpay/copay/releases/download/v${pkgver}/copay-linux.zip")

md5sums_x86_64=('ce9942be9cba6f28681d36b9fc22a6fb')

# TODO: add signature files
# TODO: test 32 bit build (maybe)

package() {

    # Prep destination
    mkdir -p ${pkgdir}/opt/copay
    cd ${pkgdir}/opt/copay

    # Unzip the binary package
    unzip ${startdir}/copay-linux.zip
    
    # Remove arch suffix 
    mv copay-linux/* .
    rmdir copay-linux

    # Symlink in to the default PATH
    mkdir -p ${pkgdir}/usr/bin
    ln -s /opt/copay/Copay ${pkgdir}/usr/bin/copay
}
