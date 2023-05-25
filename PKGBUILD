# Maintainer: Serhii Hordiienko <phrippy2@gmail.com>

pkgname=glab-bin
pkgver=1.30.0
pkgrel=2
pkgdesc='Cli tool to help work seamlessly with Gitlab from the command line'
arch=(x86_64)
url="https://gitlab.com/gitlab-org/cli/-/releases"
source=("${url}/v${pkgver}/downloads/glab_${pkgver}_Linux_${arch}.deb" "${url}/v${pkgver}/downloads/checksums.txt")
license=(MIT)
provides=("glab=$pkgver")
conflicts=(glab)
replaces=(gitlab-glab-git)
sha256sums=('efb0ecfca83231f9daf044999080c80ffef315e647588c6aaada92a04a49df76'
            '237fe3ee8f68c525d23e9e58ea887e7bbb47bd4cbc4100e02725b9c8ace1bf51')

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
