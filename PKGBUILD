#Maintainer: Dimitris Pappas <mitsakosgr@gmail.com>
pkgname=minizinc-ide
pkgver=2.0.8
pkgrel=1
pkgdesc="Simple IDE for writing and running MiniZinc models"
arch=('i686' 'x86_64')
url="http://www.minizinc.org/ide/"
license=('Mozilla Public License Version 2.0')
provides=('minizinc')
conflicts=('libminizinc')

source_x86_64=(https://github.com/MiniZinc/MiniZincIDE/releases/download/2.0.8/MiniZincIDE-2.0.8-bundle-linux-x86_64.tgz)
source_i686=(https://github.com/MiniZinc/MiniZincIDE/releases/download/2.0.8/MiniZincIDE-2.0.8-bundle-linux-x86_32.tgz)

md5sums_x86_64=(d72aefbdb83f72374bb193453693c28f)
md5sums_i686=(dc3ae1e2972a053413ffb5ff1393a065)

package() {
    cd "$srcdir"

    mkdir -p "${pkgdir}"/usr/share/"${pkgname}"

    if [ "${CARCH}" == "i686" ]; then
        _arch=32;
    else
        _arch=64;
    fi

    mv MiniZincIDE-2.0.8-bundle-linux-x86_"${_arch}"/* "${pkgdir}"/usr/share/"${pkgname}"

    cd "$pkgdir"

    cat <<EOT > usr/share/"${pkgname}"/MiniZincIDE.sh
#!/bin/sh
export LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:/usr/share/$pkgname/lib
export QT_PLUGIN_PATH=/usr/share/$pkgname/plugins
exec /usr/share/$pkgname/MiniZincIDE \$@
EOT

    mkdir -p usr/bin
    ln -s /usr/share/${pkgname}/MiniZincIDE.sh usr/bin/${pkgname}
    ln -s /usr/share/${pkgname}/minizinc usr/bin/minizinc
}
