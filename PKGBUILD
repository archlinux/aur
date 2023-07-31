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
  # Extract the source code directly to the $srcdir
  tar xf "v.${pkgver}.tar.gz" -C "$srcdir" --strip-components=1

  # Adjust the path according to the actual directory structure
  # Example: If the extracted directory is "TermNotes-1.0.4," use that instead of "src"
  cd "$srcdir/TermNotes-${pkgver}"

  # Now we are inside the correct directory, continue with the build
  gcc -o term-notes src/term_notes_linux.c
}

package() {
  cd "$srcdir/TermNotes-${pkgver}"
  install -Dm755 term-notes "${pkgdir}/usr/bin/term-notes"
}
