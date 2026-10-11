# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Gabriel Rauter <rauter.gabriel@gmail.com>

_pkgname=gnome-remote-desktop
pkgname=$_pkgname-git
pkgver=51.0.2.gbb44752
pkgrel=1
pkgdesc='Remote desktop daemon for GNOME using pipewire'
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/GNOME/gnome-remote-desktop"
license=('GPL-2.0-or-later')
depends=(
  'cairo'
  'dconf'
  'freerdp'
  'fuse3'
  'glib2'
  'glibc'
  'krb5'
  'libdrm'
  'libei'
  'libepoxy'
  'libfdk-aac'
  'libgcc'
  'libnotify'
  'libpipewire'
  'libsecret'
  'libva'
  'libvncserver'
  'libxkbcommon'
  'opus'
  'polkit'
  'systemd-libs'
  'tpm2-tss'
  'vulkan-icd-loader'
)
makedepends=(
  'asciidoc'
  'ffnvcodec-headers'
  'git'
  'glib2-devel'
  'meson'
  'shaderc'
  'spirv-tools'
  'systemd'
  'vulkan-headers'
)
optdepends=('nvidia-utils: Nvidia NVDEC/NVENC support')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://gitlab.gnome.org/GNOME/$_pkgname.git")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long | sed 's/^v//;s/-/./g;s/_/./g;'
}

build() {
  arch-meson $_pkgname build \
    -D tests=false \
    -D vnc=true
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set ts=2 sw=2 et:
