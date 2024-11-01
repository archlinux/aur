# Maintainer: lapingvino

pkgname=mobazha-bin
_name=${pkgname%-bin}
pkgver=3.2.5
pkgrel=1
pkgdesc="Mobazha Client, Decentralized Peer to Peer Marketplace for Bitcoin -- Static binaries"
arch=('x86_64')
url="https://github.com/mobazha/mobazha"
license=('MIT')
depends=('desktop-file-utils' 'glibc' 'gtk2' 'libcap' 'libgcrypt' 'libnotify' 'libxtst' 'nodejs' 'nss' 'python' 'xdg-utils')
makedepends=('npm')
optdepends=('gnome-keyring' 'gvfs' 'libgnome-keyring' 'lsb-release')
conflicts=('mobazha')
provides=('mobazha')
install=$pkgname.install
source=("https://github.com/mobazha/mobazha/releases/download/v${pkgver}/Mobazha-linux-${pkgver}-amd64.deb"
"${_name}.desktop")

package() {
    tar -xf data.tar.xz -C $pkgdir
    
    chmod -R 755 $pkgdir/usr/
    
    install -Dm644 $pkgdir/opt/Mobazha/LICENSES.chromium.html $pkgdir/usr/share/licenses/${_name}/LICENSES.chromium.html
    
    cd $pkgdir
    rm -rf usr/share/lintian
    mkdir usr/lib usr/bin
    mv opt/Mobazha usr/lib/mobazha
    ln -sr /usr/lib/mobazha/mobazha-desktop $pkgdir/usr/bin/mobazha
    cp $srcdir/${_name}.desktop usr/share/applications/
}

sha256sums=('f068c707032f35fc9b692b9df51c557d61da3037e5add2861a1c5ad979f104a0'
            'fbf464538965c4205aca68266cfe6c901839a0d7c255dbe24146bc8bf594ee30')
