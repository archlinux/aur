# Maintainer: ByteDream
pkgname=crunchy-cli-bin
pkgdesc="Command-line downloader for Crunchyroll"
arch=('x86_64' 'aarch64')
url="https://github.com/crunchy-labs/crunchy-cli"
license=('MIT')

pkgver=3.6.0
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
sha256sums_x86_64=('5572eed11b57cdf09c65f7cde1ed910e9168ebf9f1f146e95057fdf51115e774' '392393faa0616746a8bb3abca3bcf8ca3ad450f2a4e43edaf48b3af8a9dd3157' 'cebe334386bead81561b08ac3b5132e82f1910014aa1eb9c1887b1b91e5c9652' '4a5c6b7d6d7e0948869cfc1f92029dbb7503f80cd23878531f6285214e31ea24')
sha256sums_aarch64=('827525496ba1e1d5bccd4f75dbb34863ff04f14a12eb96ec9d874ade03ec4368' '392393faa0616746a8bb3abca3bcf8ca3ad450f2a4e43edaf48b3af8a9dd3157' 'cebe334386bead81561b08ac3b5132e82f1910014aa1eb9c1887b1b91e5c9652' '4a5c6b7d6d7e0948869cfc1f92029dbb7503f80cd23878531f6285214e31ea24')

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
