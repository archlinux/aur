# Maintainer: Larslol140 <lars@larslol140.com>
# Contributor: Fabian Köhler <fabian.koehler@protonmail.ch>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
# Contributor: Filippo Berto <berto.f at protonmail dot com>
# Contributor: Viktor Hundahl Strate <viktorstrate@gmail.com>

_gitname=tinyMediaManager
pkgname=tiny-media-manager
pkgver=5.0.2
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

sha256sums=('a910d7a090063c7b763320d262b0233add57c248b660c842f7d947a5542bfd07'
            '883e02f3441da81b86a1aaaf7d652bc073f409881e54dc844e1cb40ecd652fe5'
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

