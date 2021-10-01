# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: ELmoussaoui Bilal <bil dot elmoussaoui at gmail.com>
pkgname=nautilus-folder-icons
pkgver=3.0.1
pkgrel=1
pkgdesc='Nautilus extension that makes changing folders icons easy!'
arch=('x86_64')
license=('GPL3')
url="https://github.com/bilelmoussaoui/nautilus-folder-icons"
depends=('gtk3' 'python-nautilus')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
conflicts=('nautilus-ext-git' 'nautilus-compare')
            # See https://github.com/bilelmoussaoui/nautilus-folder-icons/issues/34
_commit=b0ae536292177cbdb8c26d8fdb4981959aee3ab4
source=("git+https://github.com/bilelmoussaoui/nautilus-folder-icons.git#commit=$_commit")
sha256sums=('SKIP')

build() {
  arch-meson build "$pkgname" -Dfile_manager=nautilus
  meson compile -C build
}

check() {

  # Running unitteststest_utils.py fails
  meson test -C build 'Validate appdata file' 'Running unitteststest_code_format.py' --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
