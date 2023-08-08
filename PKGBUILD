# Maintainer: ByteDream
pkgname=crunchy-cli-bin
pkgdesc="Command-line downloader for Crunchyroll"
arch=('x86_64' 'aarch64')
url="https://github.com/crunchy-labs/crunchy-cli"
license=('MIT')

pkgver=3.0.0
pkgrel=3

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
sha256sums_x86_64=('743cb45ca4cea06fd120eae2d355a1097e09f162ab2c6f59d6b4e2246af08663' '80af4ab47fb3be17b459c4af12881ec81819cfb73ba94ed540cca0f486e39c9f' '8ed0fb0d3186408e09636ceeb6af7100f269b4e817394f8c6b46a0cd0100caeb' '4a5c6b7d6d7e0948869cfc1f92029dbb7503f80cd23878531f6285214e31ea24')
sha256sums_aarch64=('1b413f16e2ebfd9ee6dfd60109cb144342cb070c0f8d84959209842df8021d9e' '80af4ab47fb3be17b459c4af12881ec81819cfb73ba94ed540cca0f486e39c9f' '8ed0fb0d3186408e09636ceeb6af7100f269b4e817394f8c6b46a0cd0100caeb' '4a5c6b7d6d7e0948869cfc1f92029dbb7503f80cd23878531f6285214e31ea24')

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

