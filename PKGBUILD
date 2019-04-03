# Maintainer: kittydoor <kittydoordev@gmail.com >
pkgname=st-kitty-git
_pkgname=st
pkgver=0.8.2.r22.f7d70ea
pkgrel=1
pkgdesc="kitty's build of st - the simple terminal by suckless"
arch=('i686' 'x86_64')
url="https://st.suckless.org/"
license=('MIT')
depends=('libxft')
makedepends=('git')
optdepends=('tmux: basic features (such as scrollback and splits)')
provides=("st")
conflicts=("st")
replaces=()
source=('git+https://gitlab.com/kittydoor/st.git')
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "%s" "$(git describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/${_pkgname}"
  make
}

package() {
  cd "$srcdir/${_pkgname}"
  make DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 README "${pkgdir}/usr/share/doc/${_pkgname}/README"
  install -Dm644 st.desktop "${pkgdir}/usr/share/applications/st.desktop"
  install -Dm644 st-tmux.desktop "${pkgdir}/usr/share/applications/st-tmux.desktop"
}
