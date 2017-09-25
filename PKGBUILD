# Maintainer: Wesley Moore <wes@wezm.net>
_pkgname=neovim-gtk
pkgname=neovim-gtk-git
pkgver=319
pkgrel=1
pkgdesc='A simple, fast and user-friendly alternative to find.'
arch=('i686' 'x86_64')
url="https://github.com/daa84/neovim-gtk"
license=('GPL3')
depends=('neovim' 'gtk3' 'vte3')
conflicts=('neovim-gtk')
provides=('neovim-gtk')
makedepends=('rust' 'cargo' 'git')
source=("git+https://github.com/daa84/neovim-gtk.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git rev-list --count HEAD
}

build() {
    cd "$srcdir/$_pkgname"
    cargo build --release
}

package() {
  install -Dm755 "$srcdir/$_pkgname/target/release/nvim-gtk" "$pkgdir/usr/bin/nvim-gtk"
  install -D -m644 "$srcdir/$_pkgname/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 "$srcdir/$_pkgname/desktop/org.daa.NeovimGtk.desktop" "${pkgdir}"/usr/share/applications/org.daa.NeovimGtk.desktop
  install -D -m644 "$srcdir/$_pkgname/desktop/org.daa.NeovimGtk.png"  "${pkgdir}"/usr/share/pixmaps/org.daa.NeovimGtk.png
}
