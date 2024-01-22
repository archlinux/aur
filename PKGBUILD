# Maintainer: Larslol140 <lars@larslol140.com>
# Contributor: Fabian Köhler <fabian.koehler@protonmail.ch>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Contributor: Filippo Berto <berto.f at protonmail dot com>
# Contributor: Viktor Hundahl Strate <viktorstrate@gmail.com>

_gitname=tinyMediaManager
pkgname=tiny-media-manager
pkgver=5.0.1
pkgrel=1
pkgdesc="A multi-OS media managment tool"
arch=('any')
url="https://www.tinymediamanager.org/"
license=('Apache')
depends=(
  'libmediainfo'
)
install=tinyMediaManager.install
noextract=("tmm_${pkgver}_linux.tar.xz")
source=("tmm_${pkgver}_linux.tar.xz::https://archive.tinymediamanager.org/v${pkgver}/tinyMediaManager-${pkgver}-linux-amd64.tar.xz"
        "tinyMediaManager.desktop"
        "tinymediamanager"
        "tinymediamanager-cli")

sha256sums=('621009533ef53268698129e0435147cc305a5928ef8f0c4c0245fb2ace010fe9'
            'ae714e16c4fc69fc2005599c5c99d1d15e0806611c8344554aa91a3606f21084'
            'd97b2206915a882c034149f3fa097445bb8bb350441bf8fdf331245e11be4f6c'
            'd6cc87cf9166f0c47940ffa6c279a9c2bc237533ebf38afb2a387532019f5675')

prepare() {
  sed -i "s|HOME_DIR|${HOME}|" "${startdir}/tinyMediaManager.install"
}

package() {
  destpath="$pkgdir/usr/share/$_gitname"
  mkdir -p "$destpath"
  tar -xvf "tmm_${pkgver}_linux.tar.xz" --directory "$destpath" --strip-components 1

  # Install desktop entry
  install -D "$srcdir/tinyMediaManager.desktop" "$pkgdir/usr/share/applications/tinyMediaManager.desktop"
  install -D "$destpath/tmm.png" "$pkgdir/usr/share/pixmaps/tmm.png"

  # Install launch scripts
  install -D "$srcdir/tinymediamanager-cli" "$pkgdir/usr/bin/tinymediamanager-cli"
  install -D "$srcdir/tinymediamanager" "$pkgdir/usr/bin/tinymediamanager"
}

