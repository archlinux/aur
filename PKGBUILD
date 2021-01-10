pkgname=briar-gtk
conflicts=('briar-gtk-git')
pkgver=0.1.0.beta2
pkgrel=2
pkgdesc='Native GTK Briar client'
url='https://code.briarproject.org/briar/briar-gtk'
arch=(any)
license=('GPL')
depends=('libhandy' 'python' 'gettext'
         'python-briar-wrapper' 'python-gobject'
         'briar-headless' 'java-runtime=11'
         'python-cairo')
makedepends=('meson' 'gtk3' 'appstream-glib' 'git' 'ninja' 'java-environment=11')
_briar_wrapper=b1bd45f151c0dc9655701e2a3ac27c7addd9c1d4
source=("git+https://code.briarproject.org/briar/${pkgname}.git#tag=0.1.0-beta2"
        "briar-wrapper::git+https://code.briarproject.org/briar/python-briar-wrapper.git#commit=${_briar_wrapper}")
sha512sums=('SKIP'
            'SKIP')

prepare() {
  cd ${pkgname}
  git submodule init
  git config submodule.python-briar-wrapper.url "$srcdir/briar-wrapper"
  git submodule update --init --recursive
}

build() {
  arch-meson ${pkgname} _build
  ninja -C _build all
}

package() {
  DESTDIR="$pkgdir" ninja install -C _build
}
