# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=quickdocs
pkgver=2.2.5
pkgrel=1
pkgdesc="GTK app for reading Valadoc and DevDocs"
arch=('x86_64')
url="https://github.com/mdh34/quickDocs"
license=('GPL3')

depends=('glib2' 'gtk3' 'hicolor-icon-theme' 'vala' 'webkit2gtk' 'devhelp' 'libarchive' 'libgee' 'granite')
makedepends=('git' 'desktop-file-utils' 'hicolor-icon-theme' 'intltool' 'yelp-tools' 'gnome-common' 'gobject-introspection' 'meson' 'ninja' 'vala')
options=('!libtool')
source=("https://github.com/mdh34/$pkgname/archive/${pkgver//_/-}.tar.gz")
sha256sums=('1ef1272fcdba00e7c641c1bd781eaca89524f0d9b256c23a1f955283ae4c75ab')

build() {
  cd "${srcdir}/quickDocs-${pkgver}"
  arch-meson -Db_pie=false build
  ninja -C build
}

package() {
  cd "${srcdir}/quickDocs-${pkgver}"
  DESTDIR="${pkgdir}/" ninja -C build install
}
