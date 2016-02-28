# Maintainer: Philipp Schmitt <philipp@schmitt.co>
_pkgname="htpc-manager"
pkgname="htpc-manager-git"
pkgver=0.11.0.r274.gcd983bf
pkgrel=3
pkgdesc="A fully responsive interface to manage all your favorite software on your Htpc"
arch=(any)
url="http://htpc.io"
license=('MIT')
depends=('python2')
source=("htpc-manager::git+https://github.com/styxit/HTPC-Manager#branch=master"
        "htpc-manager.service")
md5sums=('SKIP'
         '316c7f323af1feba917480ae67cf6543')
sha1sums=('SKIP'
          'e5015344f427e5310351fa9c979ef959142f43fc')
sha256sums=('SKIP'
            'c288870b1ad8e8d5aedf743963807720c74078a9ced878e98032501bfec08b84')
sha512sums=('SKIP'
            'a4d6ca38fe78dea43f6e765dd8fe7e598f5482d27cced84aa65b3798858b9e97db893ac91d67f151ca884d97f2ad7e5decda4201b26778c572180427f83b0a9e')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir"

    msg2 "Install HTPC Manager to /opt/$_pkgname"
    install -d -D -m 755 "${pkgdir}/opt/$_pkgname"
    cp -dpr --no-preserve=ownership "${srcdir}/$_pkgname/"* "${pkgdir}/opt/$_pkgname"

    msg2 "Create userdata folder"
    install -o http -g http -d -D -m 750 "${pkgdir}/opt/$_pkgname/userdata"

    msg2 "Install $_pkgname.service"
    install -D -m 644 "${srcdir}/$_pkgname.service" "${pkgdir}/usr/lib/systemd/system/$_pkgname.service"
}

