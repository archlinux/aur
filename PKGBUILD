# Maintainer: grzegorz225 <gorbak25@gmail.com>
pkgname=neptune-cli
_module='neptune-cli'
pkgver=2.0.22
pkgrel=1
pkgdesc="Neptune client library"
arch=('any')
url="https://neptune.ml/"
license=('Apache')
depends=('python' 'python-virtualenv' 'python-pip')
source=("LICENSE")
sha256sums=("cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30")

build() {
    cd "${srcdir}"
    virtualenv3 ./neptune-cli
    neptune-cli/bin/pip install -U neptune-cli
    virtualenv3 --relocatable ./neptune-cli
}

package() { 
    cd "${pkgdir}"
    mkdir "./opt/"
    cp -r "${srcdir}/neptune-cli" "./opt/"
    
    mkdir "./usr"
    mkdir "./usr/bin"
   
    echo "
    #!/usr/bin/env bash
    source /opt/neptune-cli/bin/activate
    function finish {
        deactivate
    }   
    trap finish EXIT
    neptune \$1" > ./usr/bin/neptune

    chmod +x ./usr/bin/neptune
}
