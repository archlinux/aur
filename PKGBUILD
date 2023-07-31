# Maintainer: Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>
pkgname=term-notes
pkgver=1.0.4
pkgrel=1
pkgdesc="Terminal-based note-taking application"
arch=('x86_64')
url="https://github.com/felipealfonsog/TermNotes"
license=('MIT')
depends=('gcc' 'vim' 'nano' 'neovim' 'libutil-linux' 'coreutils')

source=("https://github.com/felipealfonsog/TermNotes/archive/refs/tags/v.${pkgver}.tar.gz")

sha256sums=('ee0993e675697753282e874a79bce68fb433b1ecd1ca87736737ebbfba477558')

build() {
  # Create a temporary directory within the user's home directory
  tmpdir=$(mktemp -d "$HOME/tmp.XXXXXXXXXX")
  # Extract the source code directly to the temporary directory
  tar xf "v.${pkgver}.tar.gz" -C "$tmpdir" --strip-components=1
  cd "$tmpdir/src"
  gcc -o term-notes term_notes_linux.c
}

package() {
  cd "$tmpdir/src"
  install -Dm755 term-notes "${pkgdir}/usr/bin/term-notes"
  # Clean up the temporary directory after installation
  rm -rf "$tmpdir"
}
