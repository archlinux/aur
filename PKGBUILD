# Maintainer: GreyXor <greyxor@protonmail.com>

pkgname=kmscon-aetf-git
pkgver=v9.1.0.r44.g85397b6
pkgrel=1
pkgdesc='Linux KMS/DRM based virtual Console Emulator (git development version)'
arch=('x86_64')
url='https://github.com/Aetf/kmscon'
license=('MIT')
depends=(
    'bash'
    'glibc'
    'glib2'
    'libdrm'
    'libgl'
    'libtsm'
    'libxkbcommon'
    'mesa'
    'pango'
    'pixman'
    'systemd-libs'
)
provides=("kmscon")
conflicts=("kmscon")
makedepends=('check' 'libxslt' 'docbook-xsl' 'linux-api-headers' 'meson')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
backup=('etc/kmscon/kmscon.conf')

pkgver() {
  cd "$pkgname"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson kmscon-aetf-git build \
    --libexecdir=lib \
    -Dwerror=false
  meson compile -C build
}

package() {
  meson install -C build --destdir="$pkgdir"
}
