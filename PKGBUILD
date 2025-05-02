# Maintainer: Hristo Voyvodov <hristo.voyvodov@hotmail.com>

pkgname=btrust-biss
pkgver=3.35
pkgrel=2
pkgdesc='BISS (Browser Independent Signing Service) is a software for signing with Electronic Signature via web browsers when there is no availability to work with ActiveX controls.'
arch=(x86_64)
url='https://www.b-trust.org'
license=('Unknown')
source=("$url/attachments/BtrustPrivateFile/24/docs/B-TrustBISS.tar")
sha256sums=('ab2ac7499b3f544f16c93f50b4069b4891440c4026915db6d6cdef547ad3ac83')
depends=('fakeroot' 'pcsclite' 'glibc' 'gcc-libs' 'xdg-utils' 'zlib')
noextract=("B-TrustBISS.tar")

package() {
    tar xvf B-TrustBISS.tar

    # Install package
    bsdtar -O -xf btrustbiss_${pkgver}-1_amd64.deb data.tar.xz | bsdtar -C "${pkgdir}" -xJf -
    
    # Install desktop icon
    install -Dm644 "$pkgdir/opt/btrustbiss/lib/btrustbiss-BISS.desktop" "$pkgdir/usr/share/applications/btrustbiss-BISS.desktop"

    # Fix for wrong permissions on subdirs
    find "$pkgdir" -type d -exec chmod 755 {} \;
}   
