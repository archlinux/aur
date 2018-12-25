# Maintainer: ckocagil <contact-me-via-aur>
# Contributor: Maxime Gauduin <alucryd@archlinux.org> 
# Contributor: Ner0 <darkelfdarkelf666@yahoo.co.uk>
# Contributor: dcelasun <dcelasun@gmail.com>

pkgname=plank-git-patched
pkgver=0.11.4.r24.0a842b4
pkgrel=1
pkgdesc='Elegant, simple, clean dock'
arch=('x86_64')
url='https://launchpad.net/plank'
license=('GPL3')
depends=('atk' 'bamf' 'cairo' 'gdk-pixbuf2' 'glib2' 'glibc' 'gnome-menus'
         'gtk3' 'libgee' 'libwnck3' 'libx11' 'libxfixes' 'libxi' 'pango')
makedepends=('gnome-common' 'git' 'intltool' 'vala')
provides=('plank')
conflicts=('plank')
source=('git+https://github.com/ricotz/plank.git')
sha256sums=('SKIP')

pkgver() {
  cd plank

  echo "$(git describe --tags | sed 's/^v//; s/-/.r/; s/-g/./')"
}

build() {
  cd plank
  patch -p1 < ../../01_make_struts_smaller.patch
  patch -p1 < ../../02_fix_restrict_to_workspace.patch

  ./autogen.sh \
    --prefix='/usr' \
    --sysconfdir='/etc' \
    --disable-apport
  make
}

package() {
  cd plank

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
