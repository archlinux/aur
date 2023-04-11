# Maintainer: Serhii Hordiienko <phrippy2@gmail.com>

pkgname=glab-bin
pkgver=1.27.1
pkgrel=1
pkgdesc='Cli tool to help work seamlessly with Gitlab from the command line'
arch=(x86_64)
url="https://gitlab.com/gitlab-org/cli/-/releases/v${pkgver}/downloads"
source=("${url}/glab_${pkgver}_Linux_${arch}.deb" "${url}/checksums.txt")
license=(MIT)
provides=("glab=$pkgver")
conflicts=(glab)
replaces=(gitlab-glab-git)
sha256sums=(SKIP SKIP)

check() {
  grep glab_${pkgver}_Linux_${arch}.deb checksums.txt | sha256sum -c
}

package() {
  cd "$srcdir"
  bsdtar -xf data.tar.* -C "$pkgdir"
  # Shell completions
  $pkgdir/usr/bin/glab completion -s bash | install -Dm0644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/glab"
  $pkgdir/usr/bin/glab completion -s zsh  | install -Dm0644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_glab"
  $pkgdir/usr/bin/glab completion -s fish | install -Dm0644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/glab.fish"
}
