# Maintainer: ByteDream
pkgname=crunchy-cli-bin
pkgdesc="Command-line downloader for Crunchyroll"
arch=('x86_64' 'aarch64')
url="https://github.com/crunchy-labs/crunchy-cli"
license=('MIT')

pkgver=3.3.4
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
sha256sums_x86_64=('9df665fa6a17371eee8b31accdc92940f14f48491011bbf09f793da70c01b27a' '3b8de85836a8cef2798881512610acf232b914d22eeeebd4c4b27df833f4bfac' '19f0f3884e4381ec8d9e7a51a0985dde07a1240a8bf935d7798929449ca121de' '4a5c6b7d6d7e0948869cfc1f92029dbb7503f80cd23878531f6285214e31ea24')
sha256sums_aarch64=('169b10d7d3c5e70ede7d13057c68ed2f2136ea64678e689d779e9bb91e55c3f4' '3b8de85836a8cef2798881512610acf232b914d22eeeebd4c4b27df833f4bfac' '19f0f3884e4381ec8d9e7a51a0985dde07a1240a8bf935d7798929449ca121de' '4a5c6b7d6d7e0948869cfc1f92029dbb7503f80cd23878531f6285214e31ea24')

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
