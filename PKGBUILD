# Maintainer: ByteDream
pkgname=crunchy-cli-bin
pkgdesc="Command-line downloader for Crunchyroll"
arch=('x86_64' 'aarch64')
url="https://github.com/crunchy-labs/crunchy-cli"
license=('MIT')

pkgver=3.2.5
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
sha256sums_x86_64=('f0680d2bff8fa529e095ac6068ead817bff1ae4f2d6c1800afd45a8a5b5acef5' 'd4c042127430454fa7b33dccb8f451b795b13e188db550294e04f058abee4f45' '55186b173587cf60d8789acb7175dddc8f5eaba851cac4d87d625bf0a483f303' '4a5c6b7d6d7e0948869cfc1f92029dbb7503f80cd23878531f6285214e31ea24')
sha256sums_aarch64=('196f885d04efb93e8304ab185f2267f4dd83d6e9d05ab58c10db91c43a8552b6' 'd4c042127430454fa7b33dccb8f451b795b13e188db550294e04f058abee4f45' '55186b173587cf60d8789acb7175dddc8f5eaba851cac4d87d625bf0a483f303' '4a5c6b7d6d7e0948869cfc1f92029dbb7503f80cd23878531f6285214e31ea24')

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
