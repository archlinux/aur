# Maintainer: Hristo Voyvodov <hristo.voyvodov@hotmail.com>

pkgname=btrust-biss
pkgver=0.0.24
pkgrel=0
pkgdesc='BISS (Browser Independent Signing Service) is a software for signing with Electronic Signature via web browsers when there is no availability to work with ActiveX controls.'
arch=(x86_64)
url='https://www.b-trust.org'
license=('Unknown')
source=("$url/attachments/BtrustPrivateFile/24/docs/B-TrustBISS.tar")
sha256sums=('ef062e61b0c41d0238ca98c415c1b44122a8f3bf4200bf6f7a94621f17d3929b')
depends=('fakeroot' 'pcsclite' 'glibc' 'gcc-libs' 'xdg-utils' 'zlib')
noextract=("B-TrustBISS.tar")

package() {
    tar xvf B-TrustBISS.tar

    # Install package
    bsdtar -O -xf B-TrustBISS.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
    
    # Install desktop icon
    install -Dm644 "$pkgdir/opt/btrustbiss/lib/btrustbiss-BISS.desktop" "$pkgdir/usr/share/applications/btrustbiss-BISS.desktop"

    # Fix for wrong permissions on subdirs
    find "$pkgdir" -type d -exec chmod 755 {} \;
}   
