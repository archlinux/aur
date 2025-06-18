# Maintainer: Edouard Paris <edouard@wizardsardine.com>

pkgname=liana-bin
pkgver=11.1
pkgrel=1
pkgdesc="A Bitcoin wallet focused on recovery options (includes headless daemon and GUI)."
arch=('x86_64')
url=https://github.com/wizardsardine/liana
license=('BSD')
depends=('glibc>=2.33' 'fontconfig>=2.12.6' 'freetype2>=2.8' 'systemd-libs') # systemd-libs for libudev

source=("https://github.com/wizardsardine/liana/releases/download/v$pkgver/liana-$pkgver-1_amd64.deb")
sha256sums=("95ce29028b393a171c84dfb0d30ccdbfaa65b8f035ee5087c5f48837466b21c0")

prepare() {
    _output_dir="$srcdir/liana-$pkgver"

    mkdir -p "$_output_dir"
    bsdtar -xf "$srcdir/data.tar.xz" -C "$_output_dir"
}

package() {
    _usr_dir="$srcdir/liana-$pkgver/usr"

    install -D "$_usr_dir/bin/lianad" "$pkgdir/usr/bin/lianad"
    install -D "$_usr_dir/bin/liana-cli" "$pkgdir/usr/bin/liana-cli"
    install -D "$_usr_dir/bin/liana-gui" "$pkgdir/usr/bin/liana-gui"
    install -D "$_usr_dir/share/icons/liana-icon.png" "$pkgdir/usr/share/icons/liana-icon.png"
    install -D "$_usr_dir/share/applications/Liana.desktop" "$pkgdir/usr/share/applications/Liana.desktop"
}
