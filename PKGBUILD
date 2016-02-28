# Maintainer: Philipp Schmitt <philipp@schmitt.co>
_pkgname="htpc-manager"
pkgname="htpc-manager-git"
pkgver=0.11.0.r274.gcd983bf
pkgrel=1
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

    msg2 "Install HTPC Manager to /opt/htpc-manager"
    install -d -D -m 755 "${pkgdir}/opt/htpc-manager"
    cp -dpr --no-preserve=ownership "${srcdir}/htpc-manager/"* "${pkgdir}/opt/htpc-manager"

    msg2 "Create userdata folder"
    install -o http -g http -d -D -m 750 "${pkgdir}/opt/htpc-manager/userdata"

    # msg2 "Install log directory to ~htpc-manager/logs"
    # rm -rf "${pkgdir}/opt/htpc-manager/logs"
    # install -d -D -m 755 "${pkgdir}/var/lib/htpc-manager/logs"
    # ln -s /var/lib/htpc-manager/logs "${pkgdir}/opt/nzbmegasearch/logs"

    msg2 "Install htpc-manager.service"
    install -D -m 644 "${srcdir}/htpc-manager.service" "${pkgdir}/usr/lib/systemd/system/htpc-manager.service"
}

