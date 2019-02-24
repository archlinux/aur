# Maintainer: Eduardo Parra Mazuecos <eduparra90@gmail.com>

# I maintain this on github, feel free to submit a pull request to
# https://github.com/soker90/paquetes-archinux.git

_name=kickthemout
pkgname=${_name}-git
pkgver=0.1.r153.g9238b1b
pkgrel=1
pkgdesc="Kick devices off your network by performing an ARP Spoof attack."
arch=('any')
url="https://github.com/k4m4/${_name}"
license=('MIT')
depends=('python' 'kamene' 'python-nmap')
makedepends=('git')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
    git -C ${_name} describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
    cd "${srcdir}/${_name}"
    sed -i "1 s|$|2|" scan.py kickthemout.py spoof.py
    touch kickthemout
    echo #!/bin/sh >> kickthemout
    echo 'python "/usr/share/kickthemout/kickthemout.py" "$@"' >> kickthemout
    
}


package() {
    cd "${srcdir}/${_name}"

    install -m644 -D LICENSE "${pkgdir}/usr/share/licenses/$_name/LICENSE"
    install -D -m755 kickthemout.py "${pkgdir}/usr/share/${_name}/kickthemout.py"
    install -D -m755 scan.py "${pkgdir}/usr/share/${_name}/scan.py"
    install -D -m755 spoof.py "${pkgdir}/usr/share/${_name}/spoof.py"
    
    install -D -m755 kickthemout "${pkgdir}/usr/bin/kickthemout"

    
}
