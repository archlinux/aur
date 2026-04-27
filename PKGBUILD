# Maintainer: gilded <knukles30@gmail.com>

pkgname=ani-cli-mx-git
pkgver=1.0.0.r804.g30a599b
pkgrel=1
pkgdesc='Spanish-first anime CLI (development snapshot)'
arch=('any')
url='https://github.com/Gildedboy/ani-cli-mx'
license=('GPL3')
depends=('curl' 'sed' 'grep' 'fzf' 'openssl' 'mpv')
makedepends=('git')
optdepends=(
  'vlc: alternative player backend'
  'aria2: direct-file downloads'
  'yt-dlp: extra extractor coverage and download handling'
  'ffmpeg: HLS/m3u8 download fallback'
  'patch: self-update support with -U'
  'ani-skip: intro skipping with mpv'
)
source=('git+https://github.com/Gildedboy/ani-cli-mx.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/ani-cli-mx"

  local version revision commit
  version="$(sed -nE 's/^version_number="([^"]+)"/\1/p' ani-cli-mx-core | head -n1)"
  revision="$(git rev-list --count HEAD)"
  commit="$(git rev-parse --short HEAD)"
  printf '%s.r%s.g%s\n' "$version" "$revision" "$commit"
}

package() {
  cd "$srcdir/ani-cli-mx"

  install -Dm755 ani-cli-mx-core "$pkgdir/usr/libexec/ani-cli-mx-git"
  install -Dm755 packaging/aur/ani-cli-mx-git/ani-cli-mx-git "$pkgdir/usr/bin/ani-cli-mx-git"
  sed \
    -e 's/"ANI-CLI-MX"/"ANI-CLI-MX-GIT"/' \
    -e 's/"ani-cli-mx"/"ani-cli-mx-git"/g' \
    ani-cli-mx.1 > ani-cli-mx-git.1
  install -Dm644 ani-cli-mx-git.1 "$pkgdir/usr/share/man/man1/ani-cli-mx-git.1"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
