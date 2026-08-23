#Maintainer: Shadowbee <shadowbee.contact@proton.me>
pkgname=hister-bin
pkgver=0.18.0
pkgrel=1
pkgdesc="Web history on steroids - blazing fast, content-based search for visited websites"
arch=('x86_64' 'aarch64')
conflicts=('hister' 'hister-git')
url="https://github.com/asciimoo/hister"
license=('AGPL-3.0-or-later')
makedepends=('go' 'npm')
optdepends=('postgresql: For an alternate database')
install=hister.install
options=(!lto)
source_x86_64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/hister_${pkgver}_linux_amd64"
  "hister.service"
  "LICENSE::https://raw.githubusercontent.com/asciimoo/hister/refs/heads/master/LICENSE")
source_aarch64=("$pkgname-$pkgver::$url/releases/download/v$pkgver/hister_${pkgver}_linux_arm64"
  "hister.service"
  "LICENSE::https://raw.githubusercontent.com/asciimoo/hister/refs/heads/master/LICENSE")
sha256sums_x86_64=('c9d7c0fbab4b7fe52b12f971e8e6a3e2e99b4b2642def03d6027dd4803f5c1aa'
                   'eb784ed318737413345da3db8d033854f7873fb59554cd06bc45ec0fa8b6ff3a'
                   '57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6')
sha256sums_aarch64=('c9d7c0fbab4b7fe52b12f971e8e6a3e2e99b4b2642def03d6027dd4803f5c1aa'
                    'eb784ed318737413345da3db8d033854f7873fb59554cd06bc45ec0fa8b6ff3a'
                    '57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6')

_ghrepo="asciimoo/hister"

build() {
  chmod +x hister-bin-${pkgver}

  ./hister-bin-${pkgver} completion bash > hister.bash
  ./hister-bin-${pkgver} completion zsh > hister.zsh
  ./hister-bin-${pkgver} completion fish > hister.fish
}

package() {
  install -Dm755 hister-bin-${pkgver} "$pkgdir/usr/bin/hister"
  install -Dm644 "$srcdir/hister.service" "$pkgdir/usr/lib/systemd/user/hister.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 hister.bash "$pkgdir/usr/share/bash-completion/completions/hister"
  install -Dm644 hister.zsh "$pkgdir/usr/share/zsh/site-functions/_hister"
  install -Dm644 hister.fish "$pkgdir/usr/share/fish/vendor_completions.d/hister.fish"
}
