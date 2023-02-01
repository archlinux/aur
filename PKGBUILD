# Maintainer: Larslol140 <larslol140@gmail.com>
# Contributor: Fabian Köhler <fabian.koehler@protonmail.ch>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Contributor: Filippo Berto <berto.f at protonmail dot com>
# Contributor: Viktor Hundahl Strate <viktorstrate@gmail.com>

_gitname=tinyMediaManager
pkgname=tiny-media-manager
pkgver=4.3.8
pkgrel=1
pkgdesc="A multi-OS media managment tool"
arch=('any')
url="https://www.tinymediamanager.org/"
license=('Apache')
depends=('libmediainfo' 'java-runtime>=11')
install=tinyMediaManager.install
noextract=("tmm_${pkgver}_linux.tar.gz")
source=("tmm_${pkgver}_linux.tar.gz::https://archive.tinymediamanager.org/v${pkgver}/tmm_${pkgver}_linux-amd64.tar.gz"
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

sha256sums=('1fb02a72fc39c592199f11e706cce00460d78cda99589ca25678e77a3e1df8a0'
            '02bbfd492d10114cd314fc24fd7016532b0b992077d722d8bfccc4f99a79b7a3'
            '4bf36dd16bfc02a39ddde88cfcf30b4f4a5f0b08d2b34ffbab03f6553f57d596'
            '2d3df36c67a710b03b8fea3ac58c49307da8db22b7c6f8fd0011552fe94dde26'
            '0ef3bc3693a346dde08c0d01693a48ccf630bea2cb2aa2e31ce9ce77a408f2ba')
