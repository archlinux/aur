# Maintainer: ByteDream
pkgname=crunchy-cli-bin
pkgdesc="Command-line downloader for Crunchyroll"
arch=('x86_64' 'aarch64')
url="https://github.com/crunchy-labs/crunchy-cli"
license=('MIT')

pkgver=3.2.3
pkgrel=1

depends=('ffmpeg')
provides=('crunchy-cli')
conflicts=('crunchy-cli')
source_x86_64=(
  "crunchy-cli::https://github.com/crunchy-labs/crunchy-cli/releases/download/v${pkgver}/crunchy-cli-v${pkgver}-linux-x86_64"
  "manpages.zip::https://github.com/crunchy-labs/crunchy-cli/releases/download/v${pkgver}/crunchy-cli-v${pkgver}-manpages.zip"
  "completions.zip::https://github.com/crunchy-labs/crunchy-cli/releases/download/v${pkgver}/crunchy-cli-v${pkgver}-completions.zip"
  "LICENSE::https://raw.githubusercontent.com/crunchy-labs/crunchy-cli/v${pkgver}/LICENSE"
)
source_aarch64=(
  "crunchy-cli::https://github.com/crunchy-labs/crunchy-cli/releases/download/v${pkgver}/crunchy-cli-v${pkgver}-linux-aarch64"
  "manpages.zip::https://github.com/crunchy-labs/crunchy-cli/releases/download/v${pkgver}/crunchy-cli-v${pkgver}-manpages.zip"
  "completions.zip::https://github.com/crunchy-labs/crunchy-cli/releases/download/v${pkgver}/crunchy-cli-v${pkgver}-completions.zip"
  "LICENSE::https://raw.githubusercontent.com/crunchy-labs/crunchy-cli/v${pkgver}/LICENSE"
)
noextract=("manpages.zip" "completions.zip")
sha256sums_x86_64=('228bafe020bd8b3e029641ff64d9c5e00b47e5df2e6a5ff0a6d63ffa9c04e194' '193e38360d3f7c2d348955b42dea9931562dfa23ecc52c08c80d731226b13c1a' 'ba7e53e5f317d30ce2076aea73218136278f6e57c36cf20ed98876b77db1a1b3' '4a5c6b7d6d7e0948869cfc1f92029dbb7503f80cd23878531f6285214e31ea24')
sha256sums_aarch64=('82646a1ada62b5cc8d88ba5def78d97038bab79d46be6865cce72c56852bd6fd' '193e38360d3f7c2d348955b42dea9931562dfa23ecc52c08c80d731226b13c1a' 'ba7e53e5f317d30ce2076aea73218136278f6e57c36cf20ed98876b77db1a1b3' '4a5c6b7d6d7e0948869cfc1f92029dbb7503f80cd23878531f6285214e31ea24')

package() {
  cd "$srcdir"

  # all files in manpages.zip and completions.zip are stored in root of the archive, makepkg extracts them all to $srcdir
  # which makes it pretty messy. so the extraction is done manually to keep the content of $srcdir structured
  mkdir manpages completions
  cd manpages
  bsdtar -xf ../manpages.zip
  cd ../completions
  bsdtar -xf ../completions.zip
  cd ..

  install -Dm755 crunchy-cli $pkgdir/usr/bin/crunchy-cli
  install -Dm644 manpages/* -t $pkgdir/usr/share/man/man1
  install -Dm644 completions/crunchy-cli.bash $pkgdir/usr/share/bash-completion/completions/crunchy-cli
  install -Dm644 completions/_crunchy-cli $pkgdir/usr/share/zsh/site-functions/_crunchy-cli
  install -Dm644 completions/crunchy-cli.fish $pkgdir/usr/share/fish/vendor_completions.d/crunchy-cli.fish
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/crunchy-cli/LICENSE
}
