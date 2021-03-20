# Maintainer: bbbb mxk1 (at) protonmail (dot) com
# Contributor: ----

pkgname=btrustbiss
pkgver=2.26
pkgrel=1
pkgdesc="B-Trust browser independent signing service."
arch=('any')
url="https://www.b-trust.org"
license=('GPL')
backup=('etc/xdg/autostart/btrust_biss.desktop')
source=("https://www.b-trust.bg/attachments/BtrustPrivateFile/24/docs/B-TrustBISS.tar")
sha256sums=('e52aca04a7b996f5081e309e00730997723b6a18e5290961f239e43882c448b4')
depends=('fakeroot' 'binutils' 'pcsclite')
options=('!strip' '!emptydirs' '!makeflags')

package(){
    # Extract package
    tar xvf B-TrustBISS.tar
    ar xv btrustbiss.deb

    # Install package
    tar Jxf data.tar.xz -C "$pkgdir"
    
    # Fix for wrong permissions on subdirs
    find "$pkgdir" -type d -exec chmod 755 {} \;

    # Edit btrust_biss file
    sed -i "s|/x86_64-linux-gnu||g" "$pkgdir/usr/bin/btrust_biss"
}
