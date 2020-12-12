# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-code-git
pkgver=3.4.1.r149.g93118f56
pkgrel=2
pkgdesc="The Pantheon Code Editor"
arch=(x86_64)
url="https://github.com/elementary/code"
license=(GPL3)
groups=(pantheon-unstable)
depends=(libgranite.so editorconfig-core-c gtksourceview4 libgit2-glib libpeas zeitgeist libhandy)
makedepends=(appstream git gobject-introspection
             gtkspell3 intltool meson vala vte3 webkit2gtk)
optdepends=('gtkspell3: Spell Check extension'
            'vala: Outline extension'
            'vte3: Terminal extension'
            'webkit2gtk: Browser Preview extension')
provides=(pantheon-code)
conflicts=(pantheon-code scratch-text-editor elementary-code)
replaces=(scratch-text-editor-git scratch-text-editor elementary-code)
source=("${pkgname%-git}::git+https://github.com/elementary/code.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson pantheon-code build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  ln -s /usr/bin/io.elementary.code "${pkgdir}/usr/bin/e.code"
  ln -s /usr/bin/io.elementary.code "${pkgdir}/usr/bin/elementary.code"
  ln -s /usr/bin/io.elementary.code "${pkgdir}/usr/bin/elementary-code"
}

