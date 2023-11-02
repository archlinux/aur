# Maintainer: Yorick Peterse <aur AT yorickpeterse DOT com>
# Contributor: Wesley Moore <wes@wezm.net>
_pkgname=neovim-gtk
pkgname=neovim-gtk-git
pkgver=1063
pkgrel=1
pkgdesc='GTK UI for Neovim written in Rust'
arch=('x86_64')
url="https://github.com/Lyude/neovim-gtk"
license=('GPL3')
depends=('neovim' 'gtk4' 'vte4')
conflicts=('neovim-gtk')
provides=('neovim-gtk')
makedepends=('cargo' 'git')
source=("git+https://github.com/Lyude/neovim-gtk.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    /usr/bin/git rev-list --count HEAD
}

build() {
    cd "$srcdir/$_pkgname"
    /usr/bin/cargo build --release
}

package() {
  # binary
  install -Dm755 "$srcdir/$_pkgname/target/release/nvim-gtk" "$pkgdir/usr/bin/nvim-gtk"

  # runtime
  install -Dm644 "$srcdir/$_pkgname/runtime/plugin/nvim_gui_shim.vim" "$pkgdir/usr/share/nvim-gtk/runtime/nvim_gui_shim.vim"

  # desktop file
  install -D -m644 "$srcdir/$_pkgname/desktop/org.daa.NeovimGtk.desktop" "${pkgdir}"/usr/share/applications/org.daa.NeovimGtk.desktop

  # Icons
  install -D -m644 "$srcdir/$_pkgname/desktop/org.daa.NeovimGtk_128.png"  "${pkgdir}"/usr/share/icons/hicolor/128x128/apps/org.daa.NeovimGtk.png
  install -D -m644 "$srcdir/$_pkgname/desktop/org.daa.NeovimGtk_48.png"  "${pkgdir}"/usr/share/icons/hicolor/48x48/apps/org.daa.NeovimGtk.png
  install -D -m644 "$srcdir/$_pkgname/desktop/org.daa.NeovimGtk.svg"  "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/org.daa.NeovimGtk.svg
  install -D -m644 "$srcdir/$_pkgname/desktop/org.daa.NeovimGtk-symbolic.svg"  "${pkgdir}"/usr/share/icons/hicolor/symbolic/apps/org.daa.NeovimGtk-symbolic.svg

  # LICENSE
  install -D -m644 "$srcdir/$_pkgname/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
