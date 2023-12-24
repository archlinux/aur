# Maintainer: Dan Johansen <strit@strits.dk>

pkgname=intune-portal-bin
_pkgname=intune-portal
pkgver=1.2310.8
pkgrel=2
pkgdesc="Enroll devices in Microsoft Azure Endpoint"
arch=('x86_64')
url="http://intune.microsoft.com"
license=('Unknown')
provides=('intune-portal')
depends=('curl' 'at-spi2-core' 'msalsdk-dbusclient' 'gtk3' 'webkit2gtk' 'libsoup' 'libsecret' 'libpwquality' 'libx11' 'sqlite')
install=$pkgname.install
source=("https://packages.microsoft.com/ubuntu/22.04/prod/pool/main/i/${_pkgname}/${_pkgname}_${pkgver}_amd64.deb"
        "os-release")
sha256sums=('6b561c89312bcb8c6166e5c29b9adda7672bb71921bfbfd600ebe30db6f8f8b5'
            'ef3177044475bb6ab8cc77a97b889742eebf0854bbdab5f098a4c55a62c8c39e')

prepare() {
    tar -xvf data.tar.xz
}

package() {
  install -d "$pkgdir"/usr/lib/systemd/{system,user}
  install -d "$pkgdir"/opt/microsoft/intune/{bin,share}
  install -d "$pkgdir"/usr/lib/{tmpfiles.d,/security}
  install -Dm644 "$srcdir"/usr/share/pam-configs/intune -t "$pkgdir"/etc/pam.d/
  install -Dm644 "$srcdir"/usr/lib/x86_64-linux-gnu/security/pam_intune.so -t "$pkgdir"/usr/lib/security/
  install -Dm644 "$srcdir"/usr/lib/tmpfiles.d/intune.conf -t "$pkgdir"/usr/lib/tmpfiles.d/
  install -Dm644 "$srcdir"/usr/share/applications/intune-portal.desktop -t "$pkgdir"/usr/share/applications/
  install -Dm644 "$srcdir"/usr/share/icons/hicolor/48x48/apps/intune.png -t "$pkgdir"/usr/share/icons/hicolor/48x48/apps/
  install -Dm644 "$srcdir"/usr/share/polkit-1/actions/com.microsoft.intune.policy -t "$pkgdir"/usr/share/polkit-1/actions/
  install -Dm644 "$srcdir"/usr/share/doc/intune-portal/copyright -t "$pkgdir"/usr/share/doc/intune-portal/
  install -Dm644 "$srcdir"/lib/systemd/system/* "$pkgdir"/usr/lib/systemd/system/
  install -Dm644 "$srcdir"/lib/systemd/user/* "$pkgdir"/usr/lib/systemd/user/
  install -Dm755 "$srcdir"/opt/microsoft/intune/bin/* "$pkgdir"/opt/microsoft/intune/bin/
  install -Dm644 "$srcdir"/os-release -t "$pkgdir"/opt/microsoft/intune/share/
  cp -r "$srcdir"/opt/microsoft/intune/share/* "$pkgdir"/opt/microsoft/intune/share/
}
