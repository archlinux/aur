# Maintainer: Antoine Poinsot <My first name at wizardsardine.com>

pkgname=liana-bin
pkgver=7.0
pkgrel=2
pkgdesc="A Bitcoin wallet focused on recovery options (includes headless daemon and GUI)."
arch=('x86_64')
url=https://github.com/wizardsardine/liana
license=('BSD')
depends=('glibc>=2.33' 'fontconfig>=2.12.6' 'freetype2>=2.8' 'systemd-libs') # systemd-libs for libudev

source=("https://github.com/wizardsardine/liana/releases/download/v$pkgver/liana_$pkgver-1_amd64.deb")
sha256sums=("e79faa61c2dd9d8700dde6b7782a6a1ca9db47d1a02f4517e9408bb30f8aa31b")

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
