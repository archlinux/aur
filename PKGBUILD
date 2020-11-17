# Maintainer: bbbb mxk1 (at) protonmail (dot) com
# Contributor: ----

pkgname=btrustbiss
pkgver=2.22
pkgrel=1
pkgdesc="B-Trust browser independent signing service."
arch=('any')
url="https://www.b-trust.org"
license=('GPL')
backup=('etc/xdg/autostart/btrust_biss.desktop')
source=("https://www.b-trust.bg/attachments/BtrustPrivateFile/24/docs/B-TrustBISS.tar")
sha256sums=('01584bac48f764a228d30143e43cbef9d102b5f408c48a786cd697967ce975c9')
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
