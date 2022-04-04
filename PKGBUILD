# Maintainer: bbbb mxk1 (at) protonmail (dot) com
# Contributor: ----

pkgname=btrustbiss
pkgver=2.30
pkgrel=1
pkgdesc="B-Trust browser independent signing service."
arch=('any')
url="https://www.b-trust.org"
license=('GPL')
backup=('etc/xdg/autostart/btrust_biss.desktop')
source=("https://www.b-trust.bg/attachments/BtrustPrivateFile/24/docs/B-TrustBISS.tar")
sha256sums=('0f59b480b5b64e18eb07e36c48541401112be15e8416562f66503f35eba5ee07')
depends=('fakeroot' 'pcsclite')
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
