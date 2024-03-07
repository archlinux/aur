# Maintainer: a821
# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=zathura-git
pkgver=0.5.5.r1.gfb5388c
pkgrel=1
pkgdesc="Minimalistic document viewer"
arch=('x86_64')
url="https://pwmt.org/projects/zathura"
license=('Zlib')
depends=('file' 'girara-git' 'libsynctex' 'sqlite' 'desktop-file-utils' 'libseccomp')
makedepends=('git' 'python-sphinx' 'meson' 'ninja' 'texlive-bin' 'check' 'appstream-glib' 'cmake')
conflicts=('zathura')
provides=('zathura')
source=("$pkgname::git+https://git.pwmt.org/pwmt/zathura.git#branch=develop")
md5sums=('SKIP')

optdepends=(
  'zathura-djvu-git: DjVu support'
  'zathura-pdf-poppler-git: PDF support using Poppler'
  'zathura-pdf-mupdf-git: PDF support using MuPDF'
  'zathura-ps-git: PostSctipt support'
  'zathura-cb-git: Comic book support'
)

pkgver() {
  cd "$pkgname"
  git describe --tags --long | sed 's/-/.r/;s/-/./g'
}

build() {
  cd "$pkgname"
  arch-meson build -Dtests=disabled
  ninja -C build
}

package() {
  cd "$pkgname"
  DESTDIR="$pkgdir/" ninja -C build install
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
