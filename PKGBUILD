# Maintainer: envolution
# Contributor: Jan Cholasta <grubber at grubber cz>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=slade-git
pkgver=3.2.6+r3078+gd9fcc9dc5
pkgrel=1
pkgdesc='SLADE3 Doom editor (git version)'
arch=('i686' 'x86_64')
url='http://slade.mancubus.net/'
license=('GPL')
depends=('bzip2'
  'fluidsynth>=2.3'
  'freeimage'
  'ftgl'
  'glu'
  'libgl'
  'lua'
  'mpg123'
  'sfml>=2.6'
  'webkit2gtk-4.1'
  'wxwidgets-gtk3>=3.2'
  'zlib')
makedepends=('cmake'
  'git'
  'p7zip')
provides=('slade')
conflicts=('slade')
source=('slade::git+https://github.com/sirjuddington/SLADE.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/slade"
  _version=$(git tag --sort=-v:refname --list | head -n1)
  _commits=$(git rev-list --count HEAD)
  _short_commit_hash=$(git rev-parse --short=9 HEAD)
  echo "${_version}+r${_commits}+g${_short_commit_hash}"
}

build() {
  cd slade

  export CCACHE_SLOPPINESS=pch_defines,time_macros
  cmake -D CMAKE_BUILD_TYPE=None \
    -D CMAKE_INSTALL_PREFIX=/usr \
    .
  make
}

package() {
  cd slade
  make install DESTDIR="$pkgdir"
}

# vim: ts=2 sw=2 et:
# vim:set ts=2 sw=2 et:
