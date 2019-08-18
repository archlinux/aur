# Maintainer: Manish Munikar <munikarmanish@gmail.com>

pkgname=photocrypt
pkgver=0.7
pkgrel=1
pkgdesc="A text-to-image steganography tool"
arch=("i686" "x86_64")
depends=("gtkmm3" "opencv" "openssl" "vtk" "hdf5")
makedepends=("gcc" "make" "pkg-config")
url="https://github.com/munikarmanish/photocrypt"
license=("BSD")
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/munikarmanish/$pkgname/tar.gz/$pkgver
        photocrypt.desktop
        photocrypt.png)
sha256sums=("18f1d08401856563ad2c3e71e20667da42c612aac9a29e8ccade209431caa41b"
            "cb94a180ac7dcd527679b71a1a64a178ad8785f4f2d865f2f3cb0ee7fc70d735"
            "cc6d04e2e570918209184d8c5d9cb10361ee899c6c4f4b678942728c7deee270")

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg "Building..."
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg "Installing..."
  make DESTDIR="$pkgdir" install

  msg "Installing desktop entry..."
  install -Dm 644 "${srcdir}/photocrypt.desktop" "${pkgdir}/usr/share/applications/photocrypt.desktop"
  install -Dm 644 "${srcdir}/photocrypt.png" "${pkgdir}/opt/photocrypt/photocrypt.png"
}
