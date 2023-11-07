# Maintainer: Larslol140 <larslol140@gmail.com>
# Contributor: Fabian Köhler <fabian.koehler@protonmail.ch>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Contributor: Filippo Berto <berto.f at protonmail dot com>
# Contributor: Viktor Hundahl Strate <viktorstrate@gmail.com>

_gitname=tinyMediaManager
pkgname=tiny-media-manager
pkgver=4.3.14
pkgrel=1
pkgdesc="A multi-OS media managment tool"
arch=('any')
url="https://www.tinymediamanager.org/"
license=('Apache')
depends=('libmediainfo' 'java-runtime>=11')
install=tinyMediaManager.install
noextract=("tmm_${pkgver}_linux.tar.gz")
source=("tmm_${pkgver}_linux.tar.gz::https://release.tinymediamanager.org/v4/dist/tmm_${pkgver}_linux-amd64.tar.gz"
        "tinyMediaManager.desktop"
        "tinymediamanager"
        "tinymediamanager-cli"
        "tinymediamanager.JAVA_OPTS")

package() {
  destpath="$pkgdir/usr/share/$_gitname"
  mkdir -p "$destpath"
  tar -xvf "tmm_${pkgver}_linux.tar.gz" --directory "$destpath" --strip-components 1
  install -m644 tinymediamanager.JAVA_OPTS "$destpath/tmm.JAVA_OPTS"

  # Install desktop entry
  install -D "$srcdir/tinyMediaManager.desktop" "$pkgdir/usr/share/applications/tinyMediaManager.desktop"
  install -D "$destpath/tmm.png" "$pkgdir/usr/share/pixmaps/tmm.png"

  # Install launch scripts
  install -D "$srcdir/tinymediamanager-cli" "$pkgdir/usr/bin/tinymediamanager-cli"
  install -D "$srcdir/tinymediamanager" "$pkgdir/usr/bin/tinymediamanager"
}

sha256sums=('d6e5a6f3d9623c2be9be70429ffc892fcee688b39a286e13ea773ed9fdc0a487'
            '02bbfd492d10114cd314fc24fd7016532b0b992077d722d8bfccc4f99a79b7a3'
            '1b59df28ba5d1c52e6681b132a6342e8a38e4e6ae131c4f3a6db0d498f4fbf4f'
            '2d7501c13d4b608e440fec5db404a44d66fe91b2b7e2811c711feab06b292299'
            '0ef3bc3693a346dde08c0d01693a48ccf630bea2cb2aa2e31ce9ce77a408f2ba')
