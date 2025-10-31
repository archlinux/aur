# Maintainer: CharlieREV <charlie@revshell.cz>
pkgname=ica-securestore-pkcs11
pkgver=6.13.0
pkgrel=1
pkgdesc="I.CA SecureStore PKCS#11 module (smart-card crypto token support)"
arch=('x86_64')
url="https://ca.ica.cz/pub/SecureStore/linux/"
license=('proprietary')
depends=('gcc-libs' 'pcsclite' 'p11-kit') 
source=("https://ca.ica.cz/pub/SecureStore/linux/ica-securestore-pkcs11_${pkgver}-0_amd64.deb")
sha256sums=('eb13b0ba96366011dd30bf5231885ae2120e7475d1ee5faedaf549e883c74354')
install="${pkgname}.install"
provides=('ica-securestore-pkcs11')

build() {
  cd "$srcdir"
  mkdir -p "$srcdir/deb"
  bsdtar -xvf "ica-securestore-pkcs11_${pkgver}-0_amd64.deb" -C "$srcdir/deb"
  tar -xf "$srcdir/deb/data.tar.xz" -C "$srcdir/deb"
}

package() {
  install -Dm644 "$srcdir/deb/usr/lib/pkcs11/libICASecureStorePkcs11.so" "$pkgdir/usr/lib/pkcs11/libICASecureStorePkcs11.so"
  install -Dm644 /dev/stdin "$pkgdir/usr/share/p11-kit/modules/ica-securestore.module" <<EOF
module: /usr/lib/pkcs11/libICASecureStorePkcs11.so
EOF
}

