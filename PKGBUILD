# Maintainer: bbbb mxk1 (at) protonmail (dot) com
# Contributor: ----

pkgname=btrustbiss
pkgver=3.10
pkgrel=1
pkgdesc="B-Trust browser independent signing service."
arch=('any')
url="https://www.b-trust.org"
license=('GPL')
backup=('etc/xdg/autostart/btrust_biss.desktop')
source=("https://www.b-trust.bg/attachments/BtrustPrivateFile/24/docs/B-TrustBISS.tar")
sha256sums=('3ce3a05f538eab59d9212945798d660d71e09f0ab2951e5dc0d3c22198d69341')
depends=('fakeroot' 'pcsclite')
options=('!strip' '!emptydirs' '!makeflags')

package(){
    # Extract package
    tar xvf B-TrustBISS.tar
    ar xv btrustbiss_3.10-1_amd64.deb

    # Install package
    tar Jxf data.tar.xz -C "$pkgdir"
    
    # Fix for wrong permissions on subdirs
    find "$pkgdir" -type d -exec chmod 755 {} \;

    # Edit btrust_biss file
    # sed -i "s|/x86_64-linux-gnu||g" "$pkgdir/usr/bin/btrust_biss"

    # copy desktop item to applications
    install -Dm 644 ${pkgdir}/opt/${pkgname}/lib/btrustbiss-BISS.desktop -t ${pkgdir}/usr/share/applications
}
